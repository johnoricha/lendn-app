import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lendn_app/ui/screens/sign_up_screen.dart';

import '../../utils/app_images.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            image: const AssetImage(AppImages.onboardingScreenBg),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 222, bottom: 152),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 68,
                    width: 227,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(228, 22, 19, 1),
                        borderRadius: BorderRadius.all(Radius.circular(9))),
                    child: Center(child: SvgPicture.asset(AppImages.lendn)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: Container(
                      height: 65,
                      width: 252,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                              child: Text(
                            "Get Started",
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: const Color.fromRGBO(18, 16, 50, 1)),
                          )),
                          SvgPicture.asset(AppImages.getStartedIcon)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
