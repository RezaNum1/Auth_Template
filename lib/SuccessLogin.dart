import 'package:flutter/material.dart';
import 'package:letteru/Auth/presenter/login_presenter.dart';
import 'package:letteru/Auth/views/login_views.dart';
import 'package:letteru/Theme/theme_app.dart';
import 'package:letteru/Util/util_Auth.dart';

import './tabbar/pesan_masuk.dart' as pesanmasuk;
import './tabbar/selesai.dart' as selesai;
import './tabbar/status_pesan.dart' as statuspesan;
import './tabbar/todo.dart' as todo;

class SuccessLogin extends StatefulWidget {
  // String users;
  // HomePage(this.users);

  _SuccessLoginState createState() => _SuccessLoginState();
}

class _SuccessLoginState extends State<SuccessLogin>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home ULetter"),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.email),
              text: "Pesan Masuk",
            ),
            Tab(
              icon: Icon(Icons.assignment),
              text: "TODO",
            ),
          ],
        ),
      ),
      drawer: ThemeApp.sideBar(context),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          pesanmasuk.PesanMasuk(),
          todo.TODO(),
          statuspesan.StatusPesan(),
          selesai.Selesai()
        ],
      ),
    );
  }
}
