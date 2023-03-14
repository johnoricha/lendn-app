import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lendn_app/ui/screens/transfer_screen.dart';

import '../../utils/app_images.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(children: [
            Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(239, 48, 84, 1),
                      Color.fromRGBO(54, 11, 11, 1)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.15, 0.8],
                    tileMode: TileMode.repeated,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37.0, vertical: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'N170, 425',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 35,
                                color: Colors.white),
                          ),
                          Text(
                            'Available Credit',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                color: Colors.white.withOpacity(0.8)),
                          )
                        ],
                      ),
                      const Image(image: AssetImage(AppImages.profileImage))
                    ],
                  ),
                  const SizedBox(height: 62),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 27, bottom: 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 21, right: 21),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Text('Credit Score',
                                          style: GoogleFonts.dmSans(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11,
                                              color: const Color.fromRGBO(
                                                  28, 25, 57, 0.8))),
                                    ),
                                    Text.rich(TextSpan(
                                        style: GoogleFonts.dmSans(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                            color: const Color.fromRGBO(
                                                28, 25, 57, 1)),
                                        children: [
                                          WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.middle,
                                              child: SvgPicture.asset(
                                                  AppImages.greenDot)),
                                          const TextSpan(text: '700')
                                        ])),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Remark',
                                        style: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: const Color.fromRGBO(
                                                28, 25, 57, 0.8))),
                                    Text('Excellent',
                                        style: GoogleFonts.dmSans(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                            color: const Color.fromRGBO(
                                                28, 25, 57, 1))),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 1),
                          Padding(
                            padding: const EdgeInsets.only(left: 21, right: 21),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10),
                                    child: Text(
                                        '''Here are tips on how to improve your credit score to have access to more credit.''',
                                        style: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: const Color.fromRGBO(
                                                28, 25, 57, 0.8))),
                                  ),
                                  Text('Tell me more',
                                      style: GoogleFonts.dmSans(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color:
                                              const Color.fromRGBO(246, 51, 88, 1)))
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 37, bottom: 19.0),
                    child: Text('Activity',
                        style: GoogleFonts.dmSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(28, 25, 57, 1))),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            const TransferScreen()
                            ));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.05),
                                      blurRadius: 20.0,
                                      blurStyle: BlurStyle.normal,
                                      offset: Offset(14.0, 0.0))
                                ],
                                color: Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 35, top: 19, right: 34, bottom: 19),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 21.0),
                                    child: Container(
                                        width: 38,
                                        height: 38,
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(239, 48, 84, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: IconButton(
                                            onPressed: null,
                                            icon: SvgPicture.asset(
                                                AppImages.sendIcon))),
                                  ),
                                  Text(
                                    'Transfer',
                                    style: GoogleFonts.dmSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: const Color.fromRGBO(28, 25, 57, 1)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.05),
                                    blurRadius: 20.0,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset(14.0, 0.0))
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 35, top: 19, right: 34, bottom: 19),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 21.0),
                                  child: Container(
                                      width: 38,
                                      height: 38,
                                      decoration: const BoxDecoration(
                                          color: Color.fromRGBO(255, 191, 30, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: IconButton(
                                          onPressed: null,
                                          icon: SvgPicture.asset(
                                              AppImages.creditCardIcon))),
                                ),
                                Text(
                                  'My Card',
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: const Color.fromRGBO(28, 25, 57, 1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.05),
                                    blurRadius: 20.0,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset(14.0, 0.0))
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 35, top: 19, right: 34, bottom: 19),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 21.0),
                                  child: Container(
                                      width: 38,
                                      height: 38,
                                      decoration: const BoxDecoration(
                                          color: Color.fromRGBO(106, 197, 40, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: IconButton(
                                          onPressed: null,
                                          icon: SvgPicture.asset(
                                              AppImages.growthIcon))),
                                ),
                                Text(
                                  'Pay Loan',
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: const Color.fromRGBO(28, 25, 57, 1)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 45),
                  Padding(
                    padding: const EdgeInsets.only(top: 45, bottom: 19.0),
                    child: Text('Complete Verification',
                        style: GoogleFonts.dmSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(28, 25, 57, 1))),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 21, top: 27, bottom: 26, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('75%',
                                          style: GoogleFonts.dmSans(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromRGBO(
                                                  28, 25, 57, 1))),
                                      Text('7 of 10 completed',
                                          style: GoogleFonts.dmSans(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromRGBO(
                                                  28, 25, 57, 1))),
                                    ]),
                                const SizedBox(height: 14),
                                Stack(children: [
                                  SvgPicture.asset(AppImages.progressBar),
                                  SvgPicture.asset(AppImages.progress)
                                ])
                              ],
                            ),
                          ),
                          const Divider(thickness: 1),
                          Padding(
                            padding: const EdgeInsets.only(top: 23),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(AppImages.personalInfoUserIcon),
                                Padding(
                                  padding: const EdgeInsets.only(left: 23),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Personal Information',
                                          style: GoogleFonts.dmSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromRGBO(
                                                  28, 25, 57, 1))),
                                      const SizedBox(height: 13),
                                      SizedBox(
                                        width: 223,
                                        child: Text(
                                            '''When you register for an account, we collect personal information''',
                                            style: GoogleFonts.dmSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    28, 25, 57, 1))),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
