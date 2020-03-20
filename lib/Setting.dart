import 'package:flutter/material.dart';
import 'package:letteru/Theme/theme_app.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      drawer: ThemeApp.sideBar(context),
      body: Center(child: Text("Setting your preference In This Page")),
    );
  }
}
