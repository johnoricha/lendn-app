
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LendnPasswordTextField extends StatefulWidget {
  String hintText;
  BorderSide border;
  Color fillColor;
  VoidCallback? onPasswordIconPressed;
  Function(String? value) onTyping;
  String? initialValue;
  String? errorText;

  LendnPasswordTextField(
      {Key? key,
        required this.hintText,
        required this.onTyping,
        this.initialValue,
        this.errorText,
        this.border = const BorderSide(color: Color.fromRGBO(189, 189, 189, 1)),
        this.fillColor = Colors.white,
        this.onPasswordIconPressed})
      : super(key: key);

  @override
  State<LendnPasswordTextField> createState() => _AdvansioTextFieldState();
}

class _AdvansioTextFieldState extends State<LendnPasswordTextField> {

  bool isPasswordVisible = false;

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
              obscureText: !isPasswordVisible,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                errorText: widget.errorText,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: isPasswordVisible
                        ? const Icon(Icons.visibility,
                    color: Colors.grey,)
                        : const Icon(Icons.visibility_off,
                    color: Colors.grey,),
                  ),
                  contentPadding: const EdgeInsets.only(top: 13, left: 29, bottom: 17),
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
