import 'dart:async';

import 'package:car_event_organizer/domain/helper/constant.dart';
import 'package:car_event_organizer/pages/main-pages/failed-page.dart';
import 'package:car_event_organizer/pages/main-pages/success-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderingImpl {
  static final _host = Uri.http(Helper.api, '/');

  Future<void> orderTicket(String id, BuildContext ctx) async {
    try {
      final response = await http.post(
        _host.replace(path: '/api/barang/$id/kurangi-stok'),
      );
      if (response.statusCode == 200) {
        Navigator.pushAndRemoveUntil(ctx, MaterialPageRoute(builder: (c) => SuccessPage()), (route) => false);
        print(response.statusCode);
      }
    } on TimeoutException {
      throw TimeoutException('');
    }
    Exception();
  }
}