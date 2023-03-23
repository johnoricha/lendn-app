import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_images.dart';
import '../widgets/lendn_button.dart';
import 'main_screen.dart';

class TransferCompletedScreen extends StatefulWidget {
  const TransferCompletedScreen({Key? key}) : super(key: key);

  @override
  State<TransferCompletedScreen> createState() =>
      _TransferCompletedScreenState();
}

class _TransferCompletedScreenState extends State<TransferCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.thumbsUp),
            const SizedBox(height: 83),
            Text('Transfer completed successfully',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(28, 25, 57, 1))),
            const SizedBox(height: 21),
            Text('Thanks for choosing us',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(28, 25, 57, 1))),
            const SizedBox(height: 154),
            LendnButton(
                text: 'Continue',
                onClick: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MainScreen()));
                })
          ],
        ),
      ),
    );
  }
}
