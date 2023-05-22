import 'package:car_event_organizer/pages/auth-pages/create-pin.dart';
import 'package:car_event_organizer/pages/auth-pages/login-page.dart';
import 'package:car_event_organizer/pages/auth-pages/register-page.dart';
import 'package:car_event_organizer/pages/main-pages/detail-page.dart';
import 'package:car_event_organizer/pages/main-pages/failed-page.dart';
import 'package:car_event_organizer/pages/main-pages/home-page.dart';
import 'package:car_event_organizer/pages/main-pages/security-page.dart';
import 'package:car_event_organizer/pages/main-pages/success-page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}