import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:car_event_organizer/base/constant.dart';

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({Key? key}) : super(key: key);

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(KColor.mainBackground),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create your PIN!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            PinCodeFields(
              length: 4,
              fieldBorderStyle: FieldBorderStyle.square,
              responsive: false,
              fieldHeight: 40.0,
              fieldWidth: 40.0,
              borderWidth: 1.0,
              activeBorderColor: Colors.blueAccent,
              activeBackgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              keyboardType: TextInputType.number,
              autoHideKeyboard: false,
              fieldBackgroundColor: const Color(0xFF225050),
              borderColor: const Color(0xFF225050),
              textStyle: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              onComplete: (output) {
                print(output);
              },
            ),
          ],
        ),
      ),
    );
  }
}
