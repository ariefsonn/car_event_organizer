import 'dart:convert';
import 'dart:async';

import 'package:car_event_organizer/domain/entities/ticket/camp.dart';
import 'package:car_event_organizer/domain/helper/constant.dart';
import 'package:http/http.dart' as http;


class ListTicket {
  static final _host = Uri.http(Helper.api, '/');

  Future<List<Ticket>> listCampTicket () async {
    try {
      final response = await http.get(
        _host.replace(path: '/api/camp'),
      );
      if (response.statusCode == 200) {
        List o = jsonDecode(response.body);
        return o.map((e) => Ticket.fromJson(e)).toList();
      }
    } on TimeoutException {
      throw TimeoutException('');
    }
    throw Exception();
  }
  Future<List<Ticket>> listTourTicket () async {
    try {
      final response = await http.get(
        _host.replace(path: '/api/tour'),
      );
      if (response.statusCode == 200) {
        List o = jsonDecode(response.body);
        return o.map((e) => Ticket.fromJson(e)).toList();
      }
    } on TimeoutException {
      throw TimeoutException('');
    }
    throw Exception();
  }
  Future<List<Ticket>> listConcertTicket () async {
    try {
      final response = await http.get(
        _host.replace(path: '/api/concert'),
      );
      if (response.statusCode == 200) {
        List o = jsonDecode(response.body);
        return o.map((e) => Ticket.fromJson(e)).toList();
      }
    } on TimeoutException {
      throw TimeoutException('');
    }
    throw Exception();
  }
  Future<List<Ticket>> listAllTicket () async {
    try {
      final response = await http.get(
        _host.replace(path: '/api/all'),
      );
      if (response.statusCode == 200) {
        List o = jsonDecode(response.body);
        return o.map((e) => Ticket.fromJson(e)).toList();
      }
    } on TimeoutException {
      throw TimeoutException('');
    }
    throw Exception();
  }
}