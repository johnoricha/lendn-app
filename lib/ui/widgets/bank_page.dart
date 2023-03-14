import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_images.dart';
import '../../utils/app_items.dart';
import '../screens/confirm_transfer_screen.dart';


class BankPage extends StatefulWidget {
  const BankPage({Key? key}) : super(key: key);

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 37, right: 37),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 6),
        Text(
          'Enter transfer details',
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: const Color.fromRGBO(28, 25, 57, 1)),
        ),
        advansioDropdown(
            hintText: 'Select Account',
            enabled: true,
            onTap: () {
              showDropdownMenuItems(context, AppItems.selectAccountItems);
            }),
        advansioTextField('Enter Amount'),
        advansioTextField('Enter Recipient Account No.'),
        advansioDropdown(
            hintText: 'Select Recipient Bank', enabled: false, onTap: () {}),
        advansioTextField('Narration'),
        const SizedBox(height: 22),
        Container(
          height: 60,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(228, 22, 19, 1),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
              child: Text(
                'Proceed',
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              )),
        ),
      ]),
    );
  }

  Widget advansioDropdown({String hintText = '', bool enabled = true, onTap}) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: TextField(
              readOnly: true,
              onTap: () {
                onTap();
              },
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(247, 247, 247, 1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: hintText,
                  hintStyle: GoogleFonts.dmSans(
                      color: const Color.fromRGBO(44, 41, 72, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  suffixIcon: Container(
                    padding: const EdgeInsets.all(15),
                    width: 18,
                    child: SvgPicture.asset(AppImages.dropdownIcon),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget advansioTextField(String hintText) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 22),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(247, 247, 247, 1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: hintText,
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

  void showDropdownMenuItems(context, items) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 37, top: 26),
                child: Text('Select Account',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: const Color.fromRGBO(26, 25, 57, 1))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 62, bottom: 28, left: 37, right: 37),
                child: InkWell(
                  onTap: goToConfirmTransferScreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(items[0].first,
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: const Color.fromRGBO(28, 25, 57, 1)
                                  .withOpacity(0.8))),
                      Text('-',
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: const Color.fromRGBO(28, 25, 57, 1)
                                  .withOpacity(0.8))),
                      Text(items[0].second,
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: const Color.fromRGBO(28, 25, 57, 1)
                                  .withOpacity(0.8))),
                    ],
                  ),
                ),
              ),
              const Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.only(
                    top: 28, bottom: 28, left: 37, right: 37),
                child: InkWell(
                  onTap: goToConfirmTransferScreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(items[1].first,
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: const Color.fromRGBO(28, 25, 57, 1)
                                  .withOpacity(0.8))),
                      Text('-',
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: const Color.fromRGBO(28, 25, 57, 1)
                                  .withOpacity(0.8))),
                      Text(items[1].second,
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: const Color.fromRGBO(28, 25, 57, 1)
                                  .withOpacity(0.8))),
                    ],
                  ),
                ),
              ),
              const Divider(thickness: 1),
              Padding(
                padding: const EdgeInsets.only(
                    top: 28, bottom: 28, left: 37, right: 37),
                child: InkWell(
                  onTap: goToConfirmTransferScreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(items[2].first,
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: const Color.fromRGBO(28, 25, 57, 1)
                                  .withOpacity(0.8))),
                      Text('-',
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: const Color.fromRGBO(28, 25, 57, 1)
                                  .withOpacity(0.8))),
                      Text(items[2].second,
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: const Color.fromRGBO(28, 25, 57, 1)
                                  .withOpacity(0.8))),
                    ],
                  ),
                ),
              ),
              const Divider(thickness: 1)
            ],
          );
        });
  }

  void goToConfirmTransferScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
    const ConfirmTransferScreen()
    ));
  }
}
