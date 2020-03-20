import 'package:flutter/material.dart';
import 'package:letteru/Auth/presenter/forget_presenter.dart';
import 'package:letteru/Auth/presenter/login_presenter.dart';
import 'package:letteru/Auth/presenter/register_presenter.dart';
import 'package:letteru/Auth/views/forget_views.dart';
import 'package:letteru/Auth/views/register_views.dart';
import 'package:letteru/SuccessLogin.dart';
import 'package:letteru/Util/util_Auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Animation/fade_animation.dart';

class LoginViews extends StatefulWidget {
  final LoginPresenter presenter;
  LoginViews(this.presenter);
  @override
  _LoginViewsState createState() => _LoginViewsState();
}

class _LoginViewsState extends State<LoginViews> {
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  bool _validateUsername = false;
  bool _validatePassword = false;

  Future<void> loginData(String username, String password) async {
    UtilAuth.loading(context);
    var status = await this.widget.presenter.loginProccess(username, password);
    if (status['error'] == false) {
      UtilAuth.movePage(context, SuccessLogin());
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
              height: 320,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(
                      1,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/light-1.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 130,
                    width: 80,
                    height: 100,
                    child: FadeAnimation(
                      1.3,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/light-2.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 40,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(
                      1.5,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/clock.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: FadeAnimation(
                      1.6,
                      Container(
                        margin: EdgeInsets.only(top: 150, right: 180),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "ULetter",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100])),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Username',
                                  hintText: "Masukkan Username Anda",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                  errorText: _validateUsername
                                      ? "Username tidak boleh kosong!"
                                      : null),
                              controller: _usernameController,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Password',
                                  hintText: "Masukkan Password Anda",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                  errorText: _validatePassword
                                      ? "Masukkan Password Anda"
                                      : null),
                              controller: _passwordController,
                            ),
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
                        color: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.purple)),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () async {
                          if (_usernameController.text.isNotEmpty) {
                            setState(() {
                              _validateUsername = false;
                            });
                            if (_passwordController.text.isNotEmpty) {
                              setState(() {
                                _validatePassword = false;
                              });
                              loginData(_usernameController.text,
                                  _passwordController.text);
                            } else {
                              setState(() {
                                _validatePassword = true;
                              });
                            }
                          } else {
                            setState(() {
                              _validateUsername = true;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  FadeAnimation(
                    1.5,
                    Container(
                        height: 60,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: FlatButton(
                                child: Text(
                                  "Tidak Punya Akun? Register Yuk",
                                  style: TextStyle(
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  UtilAuth.movePage(context,
                                      RegisterViews(RegsiterPresenter()));
                                },
                              ),
                            ),
                            Positioned(
                              top: 25,
                              left: 50,
                              child: FlatButton(
                                child: Text(
                                  "Lupa Password?",
                                  style: TextStyle(
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  UtilAuth.movePage(
                                      context,
                                      ForgetPassword(
                                          ForgetPasswordPresenter()));
                                },
                              ),
                            ),
                          ],
                        )),
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
