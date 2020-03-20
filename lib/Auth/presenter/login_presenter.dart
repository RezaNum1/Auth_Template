import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginPresenter {
  LoginPresenter() {}

  Future<Map<String, dynamic>> loginProccess(
      String username, String password) async {
    var url = 'http://192.168.43.75:8000/api/login';
    var response = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    var parse = json.decode(response.body);
    Map<String, dynamic> data;

    if (parse['error'] == true) {
      data = {'error': parse['error'], 'message': parse['message']};
      print(data);
      return data;
    } else {
      print(parse);
      return parse;
    }
  }
}
