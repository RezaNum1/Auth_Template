import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:letteru/Util/util_Auth.dart';

class ForgetPasswordPresenter {
  ForgetPasswordPresenter() {}

  Future<Map<String, dynamic>> forgetProcess(
      String emailUser, String noTeleponUser) async {
    var url = 'http://192.168.43.75:8000/api/forgetPassword';
    var response = await http.post(url, body: {
      'email': emailUser,
      'noTelepon': noTeleponUser,
    });
    var parse = json.decode(response.body);
    Map<String, dynamic> data;

    if (parse['error'] == true) {
      data = {'error': parse['error'], 'message': parse['message']};
      return data;
    } else {
      UtilAuth.emails(parse['data']['email'], parse['data']['username'],
          parse['data']['password']);
      return data = {'error': parse['error'], 'message': parse['message']};
    }
  }
}
