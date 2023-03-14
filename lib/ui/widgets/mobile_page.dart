import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_images.dart';
import '../../utils/app_items.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  @override
  Widget build(BuildContext context) {
    const recentContacts = AppItems.recentContacts;
    const allContacts = AppItems.allContacts;

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Recent',
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: const Color.fromRGBO(28, 25, 57, 1)),
            ),
            const SizedBox(height: 14),
            Row(children: [
              Expanded(
                child: SizedBox(
                  height: 164,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recentContacts.length,
                      itemBuilder: (context, index) => recentItems(
                          recentContacts[index].first,
                          recentContacts[index].second,
                          recentContacts[index].third)),
                ),
              ),
            ]),
            const SizedBox(height: 22),
            Text(
              'All Contacts',
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: const Color.fromRGBO(28, 25, 57, 1)),
            ),
            searchBar(),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: recentContacts.length,
                  itemBuilder: (context, index) => contactsList(
                      allContacts[index].first,
                      allContacts[index].second,
                      allContacts[index].third)
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget recentItems(String image, String name, String phoneNumber) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        width: 142,
        // height: 164,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image)),
            Text(
              name,
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: const Color.fromRGBO(28, 25, 57, 1)),
            ),
            Text(phoneNumber,
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: const Color.fromRGBO(158, 166, 190, 1))),
            // const SizedBox(height: 19)
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      height: 49,
      margin: const EdgeInsets.only(top: 22),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: 'search name or number..',
                  hintStyle: GoogleFonts.dmSans(
                      color: const Color.fromRGBO(158, 166, 190, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(15),
                    width: 18,
                    child: SvgPicture.asset(AppImages.searchIcon),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget contactsList(String image, String name, String phoneNumber) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween  ,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 60,
                    height: 70,
                    child: IconButton(
                        onPressed: null,
                        icon: Image(image: AssetImage(image)))
                ),
                const SizedBox(width: 18),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color.fromRGBO(28, 25, 57, 1)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      phoneNumber,
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: const Color.fromRGBO(158, 166, 190, 1)),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 73,
              height: 35,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(158, 166, 190, 1),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Center(
                  child: Text(
                'invite',
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              )),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
