import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lendn_app/core/sign_in/sign_in_cubit.dart';
import 'package:lendn_app/core/sign_in/sign_in_state.dart';
import 'package:lendn_app/data/local/local_storage.dart';
import 'package:lendn_app/utils/cubit_state_status.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

main() {
  group('group test sign in', () {
    late MockLocalStorage localStorage;
    late SignInCubit signInCubit;
    String expectedPassword = 'password';
    String expectedEmail = 'email';

    setUp(() {
      localStorage = MockLocalStorage();
      signInCubit = SignInCubit(const SignInState(), localStorage);
    });

    blocTest('''emits [SignInState(signupStatus: LoadingState(), 
SignUpState(signupStatus: SuccessState()]  when sign in is successful''',
        build: () {
          when(() => localStorage.getEmail())
              .thenAnswer((_) async => 'email@xyz.com');
          when(() => localStorage.getPassword())
              .thenAnswer((_) async => 'Test@123');
          return signInCubit;
        },
        act: (cubit) => cubit.doSignIn('email@xyz.com', 'Test@123'),
        expect: () => [
              SignInState(
                signInStatus: LoadingState(),
              ),
              SignInState(
                signInStatus: SuccessState(),
              )
            ],
        verify: (_) {
          verify(() {
            localStorage.getEmail();
            localStorage.getPassword();
          }).called(1);
        });

    blocTest(
        '''emits [SignUpState(signupStatus: FailedState()]  when sign in is not successful''',
        build: () {
          when(() => localStorage.getEmail())
              .thenAnswer((_) async => 'email@xyz.com');
          when(() => localStorage.getPassword())
              .thenAnswer((_) async => 'Test@123');
          return signInCubit;
        },
        act: (cubit) => cubit.doSignIn('email', 'Test'),
        expect: () => [
              SignInState(
                signInStatus: LoadingState(),
              ),
              SignInState(
                errorMsg: 'Invalid credentials. Check email and password',
                signInStatus: FailedState(),
              )
            ],
        verify: (_) {
          verify(() {
            localStorage.getEmail();
            localStorage.getPassword();
          }).called(1);
        });

    blocTest(
      'emits [SignUpState(password: password)] when passwordChanged is called',
      build: () {
        return signInCubit;
      },
      act: (cubit) {
        cubit.passwordChanged('password');
      },
      expect: () => [SignInState(password: expectedPassword)],
    );

    blocTest(
      'emits [SignUpState(email: email)] when emailChanged()',
      build: () {
        return signInCubit;
      },
      act: (cubit) {
        cubit.emailChanged('email');
      },
      expect: () => [SignInState(email: expectedEmail)],
    );

    blocTest('verifies savePin() is called.', build: () {
      // when(() {
      //   localStorage.savePin('1234');
      // }).thenAnswer((_ ) => null);
      return signInCubit;
    }, act: (cubit) {
      cubit.savePin('1234');
    }, verify: (_) {
      verify(() => localStorage.savePin('1234')).called(1);
    });

    tearDown(() => signInCubit.close());
  });
}
