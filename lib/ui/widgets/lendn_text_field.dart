import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LendnTextField extends StatefulWidget {
  final String hintText;
  final BorderSide border;
  final Color fillColor;
  final Function(String? value) onTyping;
  final String? initialValue;
  final String? errorText;

  const LendnTextField({
    Key? key,
    required this.hintText,
    required this.onTyping,
    this.initialValue,
    this.errorText,
    this.border = const BorderSide(color: Color.fromRGBO(189, 189, 189, 1)),
    this.fillColor = Colors.white,
  }) : super(key: key);

  @override
  State<LendnTextField> createState() => _LendnTextFieldState();
}

class _LendnTextFieldState extends State<LendnTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: TextFormField(
              initialValue: widget.initialValue,
              onChanged: widget.onTyping,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  errorText: widget.errorText,
                  focusColor: Colors.grey,
                  contentPadding:
                      const EdgeInsets.only(top: 13, left: 29, bottom: 17),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: widget.border,
                  ),
                  fillColor: widget.fillColor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: widget.border),
                  hintText: widget.hintText,
                  hintStyle: GoogleFonts.dmSans(
                      color: const Color.fromRGBO(44, 41, 72, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
