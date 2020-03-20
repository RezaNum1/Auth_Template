import 'package:flutter/material.dart';
import 'package:letteru/Auth/presenter/forget_presenter.dart';
import 'package:letteru/Auth/presenter/login_presenter.dart';
import 'package:letteru/Auth/presenter/register_presenter.dart';
import 'package:letteru/Auth/views/forget_views.dart';
import 'package:letteru/Auth/views/login_views.dart';
import 'package:letteru/Auth/views/register_views.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Letter U',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: RegisterViews(RegsiterPresenter()),
      home: LoginViews(LoginPresenter()),
      // home: ForgetPassword(ForgetPasswordPresenter()),
    );
  }
}
