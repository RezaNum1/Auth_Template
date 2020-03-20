import 'package:flutter/material.dart';
import 'package:letteru/Util/util_Auth.dart';

import '../Account.dart' as account;
import '../SuccessLogin.dart' as home;
import '../Setting.dart' as setting;
import '../Group.dart' as group;

class ThemeApp {
  static sideBar(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "ULetter Official APP",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text(
              "Home Page",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              UtilAuth.movePage(context, home.SuccessLogin());
            },
          ),
          ListTile(
            title: Text(
              "Group",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              UtilAuth.movePage(context, group.Group());
            },
          ),
          ListTile(
            title: Text(
              "Account",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              UtilAuth.movePage(context, account.Account());
            },
          ),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              UtilAuth.movePage(context, setting.Setting());
            },
          )
        ],
      ),
    );
  }
}
