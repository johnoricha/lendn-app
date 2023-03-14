import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_images.dart';
import '../widgets/bank_page.dart';
import '../widgets/mobile_page.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [TransferBody()],
          ),
        ),
      ),
    );
  }
}

class TransferBody extends StatefulWidget {
  const TransferBody({Key? key}) : super(key: key);

  @override
  State<TransferBody> createState() => _TransferBodyState();
}

class _TransferBodyState extends State<TransferBody> {
  PageController pageController = PageController();
  int selectedPageInt = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 248,
          child: Stack(
            children: [
              const Image(image: AssetImage(AppImages.transferAppbarBg)),
              Padding(
                padding: const EdgeInsets.only(
                    left: 26, top: 27, right: 26, bottom: 27),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: SvgPicture.asset(AppImages.backArrow)),
                        ),
                        // const SizedBox(width: 120),
                        Expanded(
                          flex: 12,
                          child: SizedBox(
                              child: Text('Transfer',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal))),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedPageInt = 0;
                              pageController.jumpToPage(0);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 62,
                                width: 62,
                                decoration: BoxDecoration(
                                    color: selectedPageInt == 0
                                        ? Colors.white
                                        : const Color.fromRGBO(
                                            143, 0, 27, 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(19))),
                                child: Image(
                                    image: selectedPageInt == 0
                                        ? const AssetImage(
                                            AppImages.userIcon)
                                        : const AssetImage(
                                            AppImages.userIconUnselected)),
                              ),
                              const SizedBox(height: 7),
                              Text(
                                'Mobile',
                                style: GoogleFonts.dmSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 1)),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedPageInt == 1;
                              pageController.jumpToPage(1);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 62,
                                width: 62,
                                decoration: BoxDecoration(
                                    color: selectedPageInt == 1
                                        ? Colors.white
                                        : const Color.fromRGBO(
                                            143, 0, 27, 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(19))),
                                child: Image(
                                    image: selectedPageInt == 1
                                        ? const AssetImage(
                                            AppImages.bankIconSelected)
                                        : const AssetImage(
                                            AppImages.bankIcon)),
                              ),
                              const SizedBox(height: 7),
                              Text(
                                'Bank',
                                style: GoogleFonts.dmSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 1)),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 62,
                              width: 62,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(143, 0, 27, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(19))),
                              child: const Image(
                                  image: AssetImage(
                                      AppImages.wirelessSymbolIcon)),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              'Online',
                              style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 1)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 62,
                              width: 62,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(143, 0, 27, 1),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(19))),
                              child: const Image(
                                  image: AssetImage(AppImages.qrCodeIcon)),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              'QR code',
                              style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 1)),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 248,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: (pageInt) {
              selectedPageInt = pageInt;
              setState(() {});
            },
            children: const [MobilePage(), BankPage()],
          ),
        ),
      ],
    );
  }
}
