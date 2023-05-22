import 'package:bcrypt/bcrypt.dart';
import 'package:car_event_organizer/base/constant.dart';
import 'package:car_event_organizer/domain/usecases/order.dart';
import 'package:car_event_organizer/pages/main-pages/failed-page.dart';
import 'package:car_event_organizer/pages/main-pages/success-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  bool checkPIN = false;

  final order = OrderingImpl();
  late SharedPreferences prefs;
  String? _pin;

  Future<void> setPIN() async {
    prefs = await SharedPreferences.getInstance();
    _pin = prefs.getString('pin') ?? '';
  }

  @override
  void initState() {
    setPIN();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

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
              'Enter your PIN!',
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
                checkPIN = BCrypt.checkpw(output, _pin!);
                if (checkPIN) {
                  order.orderTicket(widget.id, context);
                } else {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => const FailedPage()), (route) => false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
