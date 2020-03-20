import 'package:flutter/material.dart';
import 'package:letteru/Theme/theme_app.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      drawer: ThemeApp.sideBar(context),
      body: Center(child: Text("Manage Your Account In This Page")),
    );
  }
}
