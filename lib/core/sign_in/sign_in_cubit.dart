import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lendn_app/core/sign_in/sign_in_state.dart';

import '../../data/local/local_storage.dart';
import '../../utils/cubit_state_status.dart';

class SignInCubit extends Cubit<SignInState> {
  final LocalStorage storage;

  SignInCubit(super.initialState, this.storage);

  Future<void> doSignIn(String email, String password) async {
    emit(state.copyWith(signInStatus: LoadingState()));

    String? storageEmail = await storage.getEmail();
    String? storagePassword = await storage.getPassword();

    try {
      if (email == storageEmail && password == storagePassword) {
        emit(state.copyWith(signInStatus: SuccessState(), errorMsg: null));
      } else {
        emit(state.copyWith(
            signInStatus: FailedState(),
            errorMsg: 'Invalid credentials. Check email and password'));
      }
    } catch (e) {
      emit(state.copyWith(signInStatus: FailedState()));
    }
  }

  void savePin(String pin) {
    storage.savePin(pin);
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

}
