import 'package:flutter/material.dart';
import 'package:letteru/Auth/presenter/forget_presenter.dart';
import 'package:letteru/Auth/presenter/login_presenter.dart';
import 'package:letteru/Auth/views/AuthComponent/phone_widget.dart';
import 'package:letteru/Auth/views/AuthComponent/text_widget.dart';
import 'package:letteru/Auth/views/login_views.dart';
import 'package:letteru/Util/util_Auth.dart';
import '../../Animation/fade_animation.dart';

class ForgetPassword extends StatefulWidget {
  final ForgetPasswordPresenter presenter;
  ForgetPassword(this.presenter);
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String email;
  String noTelepon;

  bool _validateEmail;
  bool _validateNoTelepon;

  void callBackEmail(String emails) {
    setState(() {
      email = emails;
    });
  }

  void callBackNoTelepon(String tlp) {
    setState(() {
      noTelepon = tlp;
    });
  }

  Future<void> forgetPassSend(String emailUser, String noTeleponUser) async {
    UtilAuth.loading(context);
    var status = await widget.presenter.forgetProcess(emailUser, noTeleponUser);
    if (status['error'] == false) {
      UtilAuth.successPopupDialog(
          context, status['message'], LoginViews(LoginPresenter()));
    } else {
      UtilAuth.failedPopupDialog(context, status['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: FadeAnimation(
                      1,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/forget.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: FadeAnimation(
                        1.5,
                        Container(
                          margin: EdgeInsets.only(top: 250),
                          child: Center(
                              child: Text(
                            "Lupa Password?",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          )),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                    1.8,
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          TextWidget(
                            callBackName: callBackEmail,
                            emails: true,
                            hintTexts: "Masukkan Email Anda",
                            labelTexts: 'Email',
                            messageEmpty: "Masukkan Email Yang Valid!",
                            pass: false,
                            val: _validateEmail,
                          ),
                          PhoneWidget(
                            callBackName: callBackNoTelepon,
                            vals: _validateNoTelepon,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    2,
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.purple[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.purple)),
                        child: Text(
                          "Kirim",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          if (email != null) {
                            setState(() {
                              setState(() {
                                _validateEmail = true;
                              });
                            });
                            if (noTelepon != null) {
                              setState(() {
                                _validateNoTelepon = true;
                              });

                              //Proses Di Sini
                              forgetPassSend(email, noTelepon);
                            } else {
                              setState(() {
                                _validateNoTelepon = false;
                              });
                            }
                          } else {
                            setState(() {
                              _validateEmail = false;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  FadeAnimation(
                    1.5,
                    Container(
                      child: FlatButton(
                        child: Text(
                          'Kembali Ke Halaman Login',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {
                          UtilAuth.movePage(
                              context, LoginViews(LoginPresenter()));
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
