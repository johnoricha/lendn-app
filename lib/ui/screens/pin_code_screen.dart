import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../core/sign_up/sign_up_cubit.dart';
import '../../core/sign_up/sign_up_state.dart';
import '../../di/app_initializer.dart';
import '../../utils/cubit_state_status.dart';
import '../widgets/lendn_button.dart';
import '../widgets/key_pad.dart';
import 'main_screen.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  TextEditingController myController = TextEditingController();

  String pin = '';
  late SignUpCubit _signUpCubit;

  @override
  void initState() {
    _signUpCubit = AppInitializer.getIt<SignUpCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      bloc: _signUpCubit,
      listener: (context, state) {
        if (state.setPinStatus is SuccessState) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 121),
              Text('Set your PIN',
                  style: GoogleFonts.dmSans(
                      fontSize: 26, fontWeight: FontWeight.w700)),
              const SizedBox(height: 15),
              Text('You will use this to login next time',
                  style: GoogleFonts.dmSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(28, 25, 57, 0.8))),
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
                    pin = val;
                    _signUpCubit.pinChanged(pin);
                  },
                  onSubmit: () {},
                  pinController: myController,
                  isPinLogin: true),
              const SizedBox(height: 78),
              SizedBox(
                  height: 60,
                  width: 340,
                  child: LendnButton(
                      text: 'Save PIN',
                      onClick: () {
                        if (pin.length == 4) {
                          _signUpCubit.savePin(pin);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                                Text("PIN is invalid. It must be 4 digits"),
                          ));
                        }
                      })),
            ],
          ),
        );
      },
    );
  }
}

class RoundedWithShadow extends StatefulWidget {
  const RoundedWithShadow({Key? key}) : super(key: key);

  @override
  State<RoundedWithShadow> createState() => _RoundedWithShadowState();

  @override
  String toStringShort() => 'Rounded With Shadow';
}

class _RoundedWithShadowState extends State<RoundedWithShadow> {
  TextEditingController? roundedController;
  final focusNode = FocusNode();

  @override
  void dispose() {
    roundedController?.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pincodeViewState =
        context.findAncestorStateOfType<_PinCodeScreenState>();
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
