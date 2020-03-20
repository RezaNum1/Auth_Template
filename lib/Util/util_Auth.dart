import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class UtilAuth {
  static bool emailValidate(String text) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(text)) {
      return true;
    } else {
      return false;
    }
  }

  static loading(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: SpinKitChasingDots(
            color: Colors.blue,
            size: 80.0,
          ),
        );
      },
    );
  }

  static failedPopupDialog(context, var texts) {
    Navigator.of(context, rootNavigator: true).pop();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        // return Dialog(
        return AlertDialog(
          title: Text('Peringatan!'),
          content: Text(
            '$texts',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
        // );
      },
    );
  }

  static successPopupDialog(context, var texts, Widget widget) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        // return Dialog(
        return AlertDialog(
          title: Text('Peringatan!'),
          content: Text(
            '$texts',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => widget),
                    (Route<dynamic> route) => false);
              },
            )
          ],
        );
        // );
      },
    );
  }

  static movePage(context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }

  // static stayPage(context) {}

  static void removePref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('email');
    pref.remove('nama');
  }

  static void setNamaPref(nama) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('nama', nama);
  }

  static getNamaPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var name = pref.get('nama');
    return name;
  }

  static void emails(
      String emailUser, String userUsername, String userPassword) async {
    String username = 'letteryou20@gmail.com';
    String password = 'letteryou2020';

    final smtpServer = gmail(username, password);
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add(emailUser) //recipent email
      ..subject =
          'ULETTER :: Permohonan Lupa Password :: ${DateTime.now()}' //subject of the email
      ..text =
          'Pemulihan Akun Baru Anda:: Username:  ${userUsername} | Password: ${userPassword}'; //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      // print('Message sent: ' +
      //     sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      // print('Message not sent. \n' +
      //     e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }
}
