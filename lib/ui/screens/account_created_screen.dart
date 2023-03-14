import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lendn_app/ui/screens/pin_code_screen.dart';
import 'package:lendn_app/ui/widgets/lendn_button.dart';

import '../../utils/app_images.dart';

class AccountCreatedScreen extends StatefulWidget {
  const AccountCreatedScreen({Key? key}) : super(key: key);

  @override
  State<AccountCreatedScreen> createState() => _AccountCreatedScreenState();
}

class _AccountCreatedScreenState extends State<AccountCreatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.thumbsUp),
                const SizedBox(height: 83),
                Text('Account Created!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(
                            28, 25, 57, 1))),
                const SizedBox(height: 21),
                Text('Dear user your account has been created successfully. Continue to start using app',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(
                            28, 25, 57, 1))),
                const SizedBox(height: 154),
                LendnButton(text: 'Continue', onClick: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                  const PinCodeScreen()));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
