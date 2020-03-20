import 'dart:convert';

import 'package:http/http.dart' as http;

class RegsiterPresenter {
  RegsiterPresenter() {}

  Future<String> registerProcess(String nama, String username, String password,
      String email, String noTelepon, String dataRW) async {
    var url = 'http://192.168.43.75:8000/api/register';
    var response = await http.post(url, body: {
      'namaPegawai': nama,
      'username': username,
      'password': password,
      'email': email,
      'noTelepon': noTelepon,
      'idJobPosition': dataRW
    });
    var parse = json.decode(response.body);
    if (parse['error'] == true) {
      return parse['message'];
    } else {
      return parse['message'];
    }
  }
}
