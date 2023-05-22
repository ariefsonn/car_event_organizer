import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:car_event_organizer/domain/helper/constant.dart';
import 'package:car_event_organizer/pages/auth-pages/login-page.dart';
import 'package:car_event_organizer/pages/main-pages/home-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthenticationImpl {
  static final _host = Uri.http(Helper.api, '/');
  late SharedPreferences preferences;
  late SharedPreferences _check;

  Future<void> registering(String no, String name, String pin, BuildContext ctx) async {
    try {
      final response = await http.post(
        _host.replace(path: '/api/storeUser'),
        body: <String, String> {
          'no_hp' : no,
          'nama' : name,
          'pin' : pin,
        },
      );
      if (response.statusCode == 200) {
        Navigator.pushAndRemoveUntil(ctx, MaterialPageRoute(builder: (c) => LoginPage()), (route) => false);
      }
    } on TimeoutException {
      throw TimeoutException('');
    }
    throw Exception();
  }
  Future<void> login(String no, BuildContext ctx) async {
    try {
      final response = await http.post(
        _host.replace(path: '/api/authenticate'),
        body: <String, String> {
          'no_hp' : no,
        }
      );
      if (response.statusCode == 200) {
        var o = jsonDecode(response.body);
        saveSession(ctx, o['id'].toString(), o['no_hp'], o['nama'], o['pin']);
      }
    } on TimeoutException {
      throw TimeoutException('');
    } 
    throw Exception();
  }

  void saveSession(BuildContext ctx, String id, String no, String nama, String pin) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString('id', id);
    preferences.setString('no_hp', no);
    preferences.setString('nama', nama);
    preferences.setString('pin', pin);
    preferences.setBool('is_login', true);

    Navigator.pushAndRemoveUntil(ctx, MaterialPageRoute(builder: (c) => HomePage()), (route) => false);
  }
  void checkLogin(BuildContext ctx) async {
    _check = await SharedPreferences.getInstance();
    var isLogin = _check.getBool('is_login');

    if (isLogin != null && isLogin) {
      Navigator.pushAndRemoveUntil(ctx, MaterialPageRoute(builder: (c) => HomePage()), (route) => false);
    } else {
      null;
    }
  }
}