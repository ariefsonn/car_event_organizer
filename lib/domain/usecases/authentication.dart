import 'dart:async';
import 'dart:convert';
import 'package:car_event_organizer/domain/helper/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthenticationImpl {
  static final _host = Uri.https(Helper.api, '/');
  late SharedPreferences preferences;
  late SharedPreferences _check;

  Future<void> authenticate(String no, BuildContext ctx) async {
    try {
      final response = await http.post(
        _host.replace(path: '/'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: <String, String> {
          '' : no,
        },
      );
      if (response.statusCode == 200) {
        var o = jsonDecode(response.body);
      }
    } on TimeoutException {
      throw TimeoutException('');
    }
    throw Exception();
  }
}