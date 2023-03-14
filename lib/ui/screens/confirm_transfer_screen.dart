import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lendn_app/ui/screens/transfer-completed_screen.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/app_images.dart';
import '../../data/local/local_storage.dart';
import '../../di/app_initializer.dart';
import '../widgets/lendn_button.dart';
import '../widgets/key_pad.dart';

class ConfirmTransferScreen extends StatefulWidget {
  const ConfirmTransferScreen({super.key});

  @override
  _ConfirmTransferScreenState createState() => _ConfirmTransferScreenState();
}

class _ConfirmTransferScreenState extends State<ConfirmTransferScreen> {
  TextEditingController myController = TextEditingController();

  String pin = '';
  late LocalStorage storage;

  @override
  void initState() {
    storage = AppInitializer.getIt<LocalStorage>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppImages.blackBackIcon)),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Enter your PIN',
                  style: GoogleFonts.dmSans(
                      fontSize: 26, fontWeight: FontWeight.w700)),
              const SizedBox(height: 15),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Confirm transfer of ',
                    style: GoogleFonts.dmSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(28, 25, 57, 0.8)),
                  ),
                  TextSpan(
                      text: 'N1,000.00',
                      style: GoogleFonts.dmSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(28, 25, 57, 1)))
                ],
              )),
              const SizedBox(height: 46),
              Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(138, 149, 154, 0.055),
                        blurRadius: 15.0,
                        offset: Offset(0.0, 30.0))
                  ]),
                  child: const RoundedWithShadow()),
              const SizedBox(height: 61),
              KeyPad(
                  onChange: (val) {
                    if (val.length == 4) {
                      pin = val;
                    }
                  },
                  onSubmit: () {},
                  pinController: myController,
                  isPinLogin: true),
              const SizedBox(height: 78),
              SizedBox(
                  height: 60,
                  width: 340,
                  child: LendnButton(
                      text: 'Confirm',
                      onClick: () {
                        goToTransferCompletedScreen(context);
                      })),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> goToTransferCompletedScreen(BuildContext context) async {
    if (pin == await storage.getPin()) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const TransferCompletedScreen()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Wrong pin"),
      ));
    }
  }
}

class RoundedWithShadow extends StatefulWidget {
  const RoundedWithShadow({Key? key}) : super(key: key);

  @override
  _RoundedWithShadowState createState() => _RoundedWithShadowState();

  @override
  String toStringShort() => 'Rounded With Shadow';
}

class _RoundedWithShadowState extends State<RoundedWithShadow> {
  var roundedController;
  final focusNode = FocusNode();

  @override
  void dispose() {
    roundedController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pincodeViewState =
        context.findAncestorStateOfType<_ConfirmTransferScreenState>();
    roundedController = pincodeViewState?.myController;

    final defaultPinTheme = PinTheme(
      width: 52,
      height: 52,
      textStyle: GoogleFonts.dmSans(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: const Color.fromRGBO(28, 25, 57, 1),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return Pinput(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      obscureText: true,
      obscuringCharacter: '*',
      length: 4,
      keyboardType: TextInputType.none,
      controller: roundedController,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      separator: const SizedBox(width: 13),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(138, 149, 154, 0.15),
              offset: Offset(0, 3),
              blurRadius: 32,
            )
          ],
        ),
      ),
      showCursor: false,
    );
  }
}
