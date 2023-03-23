import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyPad extends StatelessWidget {
  final double buttonSize = 60.0;
  final TextEditingController pinController;
  final Function onChange;
  final Function onSubmit;
  final bool isPinLogin;

  const KeyPad(
      {super.key, required this.onChange, required this.onSubmit, required this.pinController, required this.isPinLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('1'),
              buttonWidget('2'),
              buttonWidget('3'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('4'),
              buttonWidget('5'),
              buttonWidget('6'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('7'),
              buttonWidget('8'),
              buttonWidget('9'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 18,
              ),
              buttonWidget('0'),
              !isPinLogin
                  ? iconButtonWidget(Icons.check_circle, () {
                if (pinController.text.length > 5) {
                  pinController.text = pinController.text.substring(0, 3);
                }
                onSubmit(pinController.text);
              })
                  : Container(
                width: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }

  buttonWidget(String buttonText) {
    return SizedBox(
      child: MaterialButton(
        onPressed: () {
          if (pinController.text.length <= 3) {
            pinController.text = pinController.text + buttonText;
            onChange(pinController.text);
          }
        },
        child: Center(
          child: Text(
              buttonText,
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 24
              )
          ),
        ),
      ),
    );
  }

  iconButtonWidget(IconData icon, VoidCallback function) {
    return InkWell(
      onTap: function,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: const BoxDecoration(
            color: Colors.orangeAccent, shape: BoxShape.circle),
        child: Center(
          child: Icon(icon,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}