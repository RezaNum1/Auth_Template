import 'package:flutter/material.dart';
import 'package:letteru/Theme/theme_app.dart';

class Group extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group"),
      ),
      drawer: ThemeApp.sideBar(context),
      body: Center(
        child: Text("Find your group in this page"),
      ),
    );
  }
}
