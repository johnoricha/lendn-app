import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LendnButton extends StatefulWidget {

  final String text;
  final VoidCallback onClick;
  const LendnButton({Key? key, required this.text, required this.onClick}) : super(key: key);

  @override
  State<LendnButton> createState() => _LendnButtonState();
}

class _LendnButtonState extends State<LendnButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onClick();
      },
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(228, 22, 19, 1),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
            child: Text(
              widget.text,
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: const Color.fromRGBO(255, 255, 255, 1)),
            )),
      ),
    );
  }
}
