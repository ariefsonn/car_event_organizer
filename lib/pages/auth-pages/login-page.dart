import 'package:car_event_organizer/base/constant.dart';
import 'package:car_event_organizer/domain/usecases/authentication.dart';
import 'package:car_event_organizer/pages/auth-pages/register-page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phone = TextEditingController();
  final auth = AuthenticationImpl();

  @override
  void initState() {
    auth.checkLogin(context);
    super.initState();
  }

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
                'Login..',
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
              child: TextField(
                controller: phone,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Username',
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xFF4F7777)),
                ),
              ),
            ),
            const SizedBox(height: 13),
            GestureDetector(
              onTap: () {
                setState(() {
                  auth.login(phone.text, context);
                });
              },
              child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE0BB68),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Color(0xFF212101),
                          fontWeight: FontWeight.w700,
                          fontSize: 15.5
                      ),
                    ),
                  )
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (c) => const RegisterPage()), (route) => false);
                  });
                },
                child: const Text(
                  "Haven't registered yet? Register now!",
                  style: TextStyle(
                    color: Color(0xFF627E7F),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
