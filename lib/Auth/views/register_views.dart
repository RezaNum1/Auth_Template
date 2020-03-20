import 'package:flutter/material.dart';
import 'package:letteru/Auth/presenter/login_presenter.dart';
import 'package:letteru/Auth/presenter/register_presenter.dart';
import 'package:letteru/Auth/views/AuthComponent/header_widget.dart';
import 'package:letteru/Auth/views/AuthComponent/phone_widget.dart';
import 'package:letteru/Auth/views/AuthComponent/text_widget.dart';
import 'package:letteru/Auth/views/login_views.dart';
import '../views/AuthComponent/dropdownRW.dart';

import '../../Animation/fade_animation.dart';
import '../../Util/util_Auth.dart';

class RegisterViews extends StatefulWidget {
  final RegsiterPresenter presenter;
  RegisterViews(this.presenter);
  @override
  _RegisterViewsState createState() => _RegisterViewsState();
}

class _RegisterViewsState extends State<RegisterViews> {
  String rwText;
  String namaPegawai;
  String username;
  String passwords;
  String email;
  String noTelepon;

  bool validateDropDown = true;
  bool _validate = true;
  bool _validateUsername = true;
  bool _validatePass = true;
  bool _validateemail = true;
  bool _validateNoTelepon = true;

  void callBack(String text) {
    setState(() {
      rwText = text;
    });
  }

  void callBackNamaPegawai(String texts) {
    setState(() {
      namaPegawai = texts;
    });
  }

  void callBackUsername(String texts) {
    setState(() {
      username = texts;
    });
  }

  void callBackPassword(String texts) {
    setState(() {
      passwords = texts;
    });
  }

  void callBackEmail(String texts) {
    setState(() {
      email = texts;
    });
  }

  void callBackNoTelp(String texts) {
    setState(() {
      noTelepon = texts;
    });
  }

  Future<void> processData(String nama, String username, String password,
      String email, String noTelepon, String dataRW) async {
    UtilAuth.loading(context);
    var res = await widget.presenter
        .registerProcess(nama, username, password, email, noTelepon, dataRW);
    if (res[0] == false) {
      UtilAuth.successPopupDialog(
          context, res[1], LoginViews(LoginPresenter()));
    } else {
      // UtilLetterU.stayPage(context);
      UtilAuth.failedPopupDialog(context, res[1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final _formKey = GlobalKey<FormState>();
    return Scaffold(
      // key: _formKey,
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            HeaderWidget(),
            Padding(
              padding: EdgeInsets.only(right: 25, left: 25, bottom: 25),
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
                            color: Color.fromRGBO(255, 221, 89, 2),
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          TextWidget(
                            callBackName: callBackNamaPegawai,
                            hintTexts: 'Masukkan Nama Anda',
                            labelTexts: 'Nama Pegawai',
                            messageEmpty: 'Nama Pegawai Tidak Boleh Kosong',
                            val: _validate,
                            emails: false,
                            pass: false,
                          ),
                          TextWidget(
                            callBackName: callBackUsername,
                            hintTexts: 'Masukkan Username Anda',
                            labelTexts: 'Username',
                            messageEmpty: 'Username Tidak Boleh Kosong!',
                            val: _validateUsername,
                            emails: false,
                            pass: false,
                          ),
                          TextWidget(
                            callBackName: callBackPassword,
                            hintTexts: "Masukkan Password Anda",
                            labelTexts: "Password",
                            messageEmpty: "Password Tidak Boleh Kosong",
                            val: _validatePass,
                            emails: false,
                            pass: true,
                          ),
                          TextWidget(
                            callBackName: callBackEmail,
                            hintTexts: "Masukkan Email Aktif Anda",
                            labelTexts: "Email",
                            messageEmpty: "Masukkan Email Yang Valid",
                            val: _validateemail,
                            emails: true,
                            pass: false,
                          ),
                          PhoneWidget(
                            callBackName: callBackNoTelp,
                            vals: _validateNoTelepon,
                          ),
                          DropDownRW(rwText, callBack, validateDropDown),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                            2,
                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.orange,
                                ),
                                child: FlatButton(
                                  child: Text(
                                    'Buat Akun Baru',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (namaPegawai != null) {
                                      setState(() {
                                        _validate = true;
                                      });
                                      if (username != null) {
                                        setState(() {
                                          _validateUsername = true;
                                        });
                                        print(passwords != null);
                                        if (passwords != null) {
                                          setState(() {
                                            _validatePass = true;
                                          });
                                          if (email != null &&
                                              UtilAuth.emailValidate(email) ==
                                                  false) {
                                            setState(() {
                                              _validateemail = true;
                                            });

                                            if (noTelepon != null) {
                                              setState(() {
                                                _validateNoTelepon = true;
                                              });
                                              if (rwText == "Pilih RW Anda") {
                                                setState(() {
                                                  validateDropDown = false;
                                                });
                                              } else {
                                                setState(() {
                                                  validateDropDown = true;
                                                });

                                                // Proses Di Sini
                                                processData(
                                                    namaPegawai,
                                                    username,
                                                    passwords,
                                                    email,
                                                    noTelepon,
                                                    rwText.toString());
                                              }
                                            } else {
                                              setState(() {
                                                _validateNoTelepon = false;
                                              });
                                            }
                                          } else {
                                            _validateemail = false;
                                          }
                                        } else {
                                          setState(() {
                                            _validatePass = false;
                                          });
                                        }
                                      } else {
                                        setState(() {
                                          _validateUsername = false;
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        _validate = false;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          FlatButton(
                            child: Text(
                              'Belum Punya Akun ? SingIn',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              UtilAuth.movePage(
                                  context, LoginViews(LoginPresenter()));
                            },
                          )
                        ],
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
