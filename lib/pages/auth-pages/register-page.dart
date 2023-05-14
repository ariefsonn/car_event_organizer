import 'package:car_event_organizer/base/constant.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(KColor.mainBackground),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Register..',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFF225050),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.only(left: 10),
              child: const TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xFF4F7777)),
                ),
              ),
            ),
            const SizedBox(height: 7),
            Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFF225050),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.only(left: 10),
              child: const TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your username',
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xFF4F7777)),
                ),
              ),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                Container(
                  width: 107,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFF225050),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.only(left: 38),
                  child: const TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Date',
                      hintStyle: TextStyle(fontSize: 14, color: Color(0xFF4F7777)),
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Container(
                  width: 107,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFF225050),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.only(left: 34),
                  child: const TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Month',
                      hintStyle: TextStyle(fontSize: 14, color: Color(0xFF4F7777)),
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Container(
                  width: 102,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFF225050),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.only(left: 38),
                  child: const TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Year',
                      hintStyle: TextStyle(fontSize: 14, color: Color(0xFF4F7777)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            GestureDetector(
              onTap: () {},
              child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE0BB68),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                          color: Color(0xFF212101),
                          fontWeight: FontWeight.w700,
                          fontSize: 15.5
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
