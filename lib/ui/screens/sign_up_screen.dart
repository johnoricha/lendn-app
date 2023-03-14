import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lendn_app/ui/screens/sign_in_screen.dart';

import '../../core/sign_up/sign_up_cubit.dart';
import '../../core/sign_up/sign_up_state.dart';
import '../../di/app_initializer.dart';
import '../../utils/cubit_state_status.dart';
import '../widgets/lendn_button.dart';
import '../widgets/lendn_password_text_field.dart';
import '../widgets/lendn_text_field.dart';
import 'account_created_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _myBool = false;
  late SignUpCubit _signUpCubit;

  @override
  void initState() {
    _signUpCubit = AppInitializer.getIt<SignUpCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 37.0, right: 37),
            child: BlocConsumer<SignUpCubit, SignUpState>(
                bloc: _signUpCubit,
                listener: (context, state) {
                  if (state.signupStatus is SuccessState) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const AccountCreatedScreen()));
                  }
                },
                builder: (context, state) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Welcome!',
                            style: GoogleFonts.dmSans(
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                                color:
                                const Color.fromRGBO(28, 25, 57, 1))),
                        const SizedBox(height: 21),
                        Text(
                          'Please provide the following details for your new account',
                          style: GoogleFonts.dmSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color:
                              const Color.fromRGBO(28, 25, 57, 0.8)),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 62),
                        LendnTextField(
                          onTyping: (val) {
                            _signUpCubit.fullNameChanged(val ?? '');
                          },
                          hintText: 'Full Name',
                          border: const BorderSide(),
                        ),
                        const SizedBox(height: 5),
                        LendnTextField(
                          // errorText: state.errorMsg,
                            onTyping: (val) {
                              _signUpCubit.emailChanged(val ?? '');
                            },
                            hintText: 'Email Address',
                            fillColor:
                            const Color.fromRGBO(247, 247, 247, 1),
                            border: BorderSide.none),
                        const SizedBox(height: 5),
                        LendnPasswordTextField(
                            onTyping: (val) {
                              _signUpCubit.passwordChanged(val ?? '');
                            },
                            hintText: 'Password',
                            fillColor:
                            const Color.fromRGBO(247, 247, 247, 1),
                            border: BorderSide.none),
                        const SizedBox(height: 28),
                        TextButton(
                            onPressed: () =>
                                setState(() => _myBool = !_myBool),
                            child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 26.0,
                                      width: 26.0,
                                      child: Checkbox(
                                          activeColor: Colors.red,
                                          shape:
                                          const RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(
                                                  Radius.circular(
                                                      4))),
                                          value: state.isTermsAgreed,
                                          onChanged: (value) {
                                            _signUpCubit
                                                .termsAgreementChanged(
                                                value ?? false);
                                          })),
                                  const SizedBox(width: 9.0),
                                  SizedBox(
                                    width: 246,
                                    child: Text(
                                        'By creating your account you have to agree with our Teams and Conditions.',
                                        style: GoogleFonts.dmSans(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                28, 25, 57, 0.8))),
                                  ),
                                ])),
                        const SizedBox(height: 62),
                        LendnButton(
                            text: 'Sign up my Account',
                            onClick: () {
                              if (_signUpCubit.areAllFieldsValid() ==
                                  null) {
                                print('fields valid returns null');
                                _signUpCubit.doSignUp(state.fullName.trim(),
                                    state.email.trim(), state.password.trim());
                              } else {
                                var error =
                                _signUpCubit.areAllFieldsValid();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(error ?? ''),
                                ));
                              }
                            }),
                        const SizedBox(height: 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account? ',
                                style: GoogleFonts.dmSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(
                                        28, 25, 57, 1))),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const SignInScreen()));
                              },
                              child: Text('- Sign In',
                                  style: GoogleFonts.dmSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          28, 25, 57, 1))),
                            ),
                          ],
                        )
                      ]);
                }),
          ),
        ),
      ),
    );
  }
}
