import 'package:car_event_organizer/base/constant.dart';
import 'package:car_event_organizer/pages/main-pages/home-page.dart';
import 'package:car_event_organizer/pages/main-pages/security-page.dart';
import 'package:flutter/material.dart';

class FailedPage extends StatefulWidget {
  const FailedPage({Key? key}) : super(key: key);

  @override
  State<FailedPage> createState() => _FailedPageState();
}

class _FailedPageState extends State<FailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              color: Color(KColor.mainBackground)
          ),
          child: Column(
            children: [
              const SizedBox(height: 250),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  minimumSize: const Size(100, 100),
                ),
                onPressed: () {},
                child: Image.asset('assets/fail.png', width: 65, height: 65),
              ),
              const SizedBox(height: 20),
              const Text(
                'Failed 😞',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => const SecurityPage()), (route) => false);
                },
                child: Container(
                    width: 105,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE0BB68),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Center(
                      child: Text(
                        'GO BACK',
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
          )
      ),
    );
  }
}
