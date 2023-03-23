import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lendn_app/core/sign_up/sign_up_cubit.dart';
import 'package:lendn_app/core/sign_up/sign_up_state.dart';
import 'package:lendn_app/data/local/local_storage.dart';
import 'package:lendn_app/utils/cubit_state_status.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

main() {
  group('group test sign up', () {
    late MockLocalStorage localStorage;
    late SignUpCubit signUpCubit;
    String expectedPassword = 'password';
    String expectedFullName = 'full name';
    String expectedEmail = 'email';
    bool expectedIsTermsAgreed = true;

    setUp(() {
      localStorage = MockLocalStorage();
      signUpCubit = SignUpCubit(const SignUpState(), localStorage);
    });

    blocTest(
      '''emits [SignUpState(signupStatus: LoadingState(), 
SignUpState(signupStatus: SuccessState()]  when sign up is successful''',
      build: () {
        return signUpCubit;
      },
      act: (cubit) => cubit.doSignUp('john', 'email', 'password'),
      expect: () => [
        SignUpState(
          signupStatus: LoadingState(),
        ),
        SignUpState(
          signupStatus: SuccessState(),
        )
      ],
    );

    blocTest(
      'emits [SignUpState(password: password)] when passwordChanged is called',
      build: () {
        return signUpCubit;
      },
      act: (cubit) {
        cubit.passwordChanged('password');
      },
      expect: () => [SignUpState(password: expectedPassword)],
    );

    blocTest(
      'emits [SignUpState(fullname: full name)] fullNameChanged is called',
      build: () {
        return signUpCubit;
      },
      act: (cubit) {
        cubit.fullNameChanged('full name');
      },
      expect: () => [SignUpState(fullName: expectedFullName)],
    );

    blocTest('emits [SignUpState(email: email)] when emailChanged()',
        build: () {
          when(() => localStorage.getEmail()).thenAnswer((_) async => 'email');
          return signUpCubit;
        },
        act: (cubit) {
          cubit.emailChanged('email');
        },
        expect: () => [SignUpState(email: expectedEmail)],
        verify: (_) {
          verify(() {
            localStorage.getEmail();
          }).called(1);
        });

    blocTest(
      'emits [SignUpState(pin: 1234) when pinChanged() is called',
      build: () {
        return signUpCubit;
      },
      act: (cubit) {
        cubit.pinChanged('1234');
      },
      expect: () => [const SignUpState(pin: '1234')],
    );

    blocTest(
      'emits [] when pin digits is greater than 4',
      build: () {
        return signUpCubit;
      },
      act: (cubit) {
        cubit.pinChanged('123456');
      },
      expect: () => [],
    );

    blocTest(
      'emits [] when pin digits is less than 4',
      build: () {
        return signUpCubit;
      },
      act: (cubit) {
        cubit.pinChanged('12');
      },
      expect: () => [],
    );

    blocTest(
      'emits [SignUpState(isTermsAgreed: true)] when termsAgreedChanged is called with true',
      build: () {
        return signUpCubit;
      },
      act: (cubit) {
        cubit.termsAgreementChanged(true);
      },
      expect: () => [SignUpState(isTermsAgreed: expectedIsTermsAgreed)],
    );


  });
}
