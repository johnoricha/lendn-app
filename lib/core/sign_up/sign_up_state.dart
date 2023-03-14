import 'package:equatable/equatable.dart';

import '../../utils/cubit_state_status.dart';

class SignUpState extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String errorMsg;
  final bool isTermsAgreed;
  final String pin;
  final StateStatus? signupStatus;
  final StateStatus? setPinStatus;

  const SignUpState({
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.errorMsg = '',
    this.pin = '',
    this.isTermsAgreed = false,
    this.signupStatus,
    this.setPinStatus,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        password,
        errorMsg,
        pin,
        isTermsAgreed,
        signupStatus,
        setPinStatus,
      ];

  SignUpState copyWith(
      {String? fullName,
      String? email,
      String? password,
      String? errorMsg,
      String? pin,
      bool? isTermsAgreed,
      StateStatus? signupStatus,
      StateStatus? setPinStatus
      }) {
    return SignUpState(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        password: password ?? this.password,
        errorMsg: errorMsg ?? this.errorMsg,
        pin: pin ?? this.pin,
        isTermsAgreed: isTermsAgreed ?? this.isTermsAgreed,
        signupStatus: signupStatus ?? this.signupStatus,
        setPinStatus: setPinStatus ?? this.setPinStatus
    );
  }
}
