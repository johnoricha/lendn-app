import 'package:equatable/equatable.dart';

import '../../utils/cubit_state_status.dart';

class SignInState extends Equatable {
  final String email;
  final String password;
  final String? errorMsg;
  final bool allFieldsValid;
  final bool isPasswordValid;
  final StateStatus? signInStatus;

  const SignInState({
    this.email = '',
    this.password = '',
    this.errorMsg = '',
    this.isPasswordValid = false,
    this.allFieldsValid = false,
    this.signInStatus,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        errorMsg,
        isPasswordValid,
        allFieldsValid,
        signInStatus,
      ];

  SignInState copyWith(
      {String? email,
      String? password,
      String? errorMsg,
      bool? isPasswordValid,
      bool? allFieldsValid,
      StateStatus? signInStatus}) {
    return SignInState(
        email: email ?? this.email,
        password: password ?? this.password,
        errorMsg: errorMsg ?? this.errorMsg,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        allFieldsValid: allFieldsValid ?? this.allFieldsValid,
        signInStatus: signInStatus ?? this.signInStatus);
  }
}
