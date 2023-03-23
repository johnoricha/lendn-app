import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lendn_app/core/sign_up/sign_up_state.dart';

import '../../data/local/local_storage.dart';
import '../../utils/cubit_state_status.dart';
import '../../utils/validator_helper.dart';


class SignUpCubit extends Cubit<SignUpState> {
  final LocalStorage storage;
  bool mUserExists = false;

  SignUpCubit(super.initialState, this.storage);

  void doSignUp(String fullName, String email, String password) async {

    emit(state.copyWith(signupStatus: LoadingState()));

      try {
        storage.saveFullName(fullName);
        storage.saveEmail(email);
        storage.savePassword(password);
        emit(state.copyWith(signupStatus: SuccessState()));
      } catch (e) {
        emit(state.copyWith(signupStatus: FailedState()));
      }
  }

  void savePin(String pin) {
    if (pin.length == 4) {
      try {
        storage.savePin(pin);
        emit(state.copyWith(setPinStatus: SuccessState()));
      } catch (e) {
        emit(state.copyWith(setPinStatus: FailedState()));
      }
    } else {
      emit(state.copyWith(
          setPinStatus: FailedState(),
          errorMsg: 'PIN is invalid. It must be 4 digits'));
    }
  }

  void fullNameChanged(String value) {
    emit(state.copyWith(fullName: value));
  }

  void emailChanged(String value) {
    checkIfUserExists(value);
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void pinChanged(String value) {
    if (value.length == 4) {
      emit(state.copyWith(pin: value));
    }
  }

  void termsAgreementChanged(bool isAgreed) {
    emit(state.copyWith(isTermsAgreed: isAgreed));
  }

  String? areAllFieldsValid() {
    if (state.fullName.isNotEmpty &&
        state.email.isNotEmpty &&
        state.isTermsAgreed &&
        state.password.isNotEmpty) {
      if (ValidatorHelper.getPasswordValidationReport(state.password)) {

        if (!mUserExists) {
        return null;
        } else {
          return 'Email already exists';
        }

      } else {
        return 'Invalid password. Password must contain at least:\n8 characters \n1 uppercase \n1 lowercase \n1 symbol \n1 digit \nno whitespace';
      }
    } else {
      return 'All fields are required and cannot be empty';
    }
  }

  void checkIfUserExists(String email) async {
    mUserExists = false;
    if (email == await storage.getEmail()) {
      mUserExists = true;
    }

  }
}
