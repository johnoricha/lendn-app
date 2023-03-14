import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lendn_app/ui/widgets/lendn_password_text_field.dart';
import 'package:lendn_app/ui/widgets/lendn_text_field.dart';

import '../../core/sign_in/sign_in_cubit.dart';
import '../../core/sign_in/sign_in_state.dart';
import '../../data/local/local_storage.dart';
import '../../di/app_initializer.dart';
import '../../utils/cubit_state_status.dart';
import '../widgets/lendn_button.dart';
import 'main_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late SignInCubit _signInCubit;

  @override
  void initState() {
    _signInCubit = AppInitializer.getIt<SignInCubit>();
        SignInCubit(const SignInState(), LocalStorage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      bloc: _signInCubit,
      listener: (context, state) {
        if (state.signInStatus is SuccessState) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 37, right: 37),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text('Welcome Back!',
                            style: GoogleFonts.dmSans(
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(28, 25, 57, 1))),
                      ),
                      const SizedBox(height: 21),
                      Text(
                        'Sign in to continue',
                        style: GoogleFonts.dmSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(28, 25, 57, 0.8)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 62),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LendnTextField(
                            hintText: 'Email',
                            border: BorderSide(),
                            onTyping: (String? value) {
                              _signInCubit.emailChanged(value?.trim() ?? '');
                            },
                          ),
                          const SizedBox(height: 5),
                          LendnPasswordTextField(
                            hintText: 'Password',
                            fillColor: const Color.fromRGBO(247, 247, 247, 1),
                            border: BorderSide.none,
                            onTyping: (String? value) {
                              _signInCubit.passwordChanged(value?.trim() ?? '');
                            },
                          ),
                          const SizedBox(height: 21),
                          Visibility(
                            visible: state.errorMsg != null,
                            child: Text(
                              state.errorMsg??'',
                              style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red),
                              textAlign: TextAlign.end,
                            ),
                          ),

                          Text(
                            'Forgot Password?',
                            style: GoogleFonts.dmSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(28, 25, 57, 0.8)),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      const SizedBox(height: 51),
                      LendnButton(
                        text: 'Sign in my Account',
                        onClick: () {
                          _signInCubit.doSignIn(state.email.trim(), state.password.trim());
                        }
                      ),
                      const SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ",
                              style: GoogleFonts.dmSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(28, 25, 57, 1))),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text('- Sign Up',
                                style: GoogleFonts.dmSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        const Color.fromRGBO(28, 25, 57, 1))),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
