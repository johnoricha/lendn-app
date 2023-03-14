
mixin ValidatorHelper {
  static const String minimumLength = 'minimumLength';
  static const String hasDigit = 'hasDigit';
  static const String hasUppercase = 'hasUppercase';
  static const String hasLowercase = 'hasLowercase';
  static const String hasSpecialChar = 'hasSpecialCharacter';
  static const String hasNoSpace = 'hasNoSpace';

  static const String length = 'length';
  static const String digit = 'digit';
  static const String uppercase = 'uppercase';
  static const String lowercase = 'lowercase';
  static const String specialChar = 'specialChar';
  static const String noSpace = 'noSpace';

  static const String _emailValidatorRegExp =
      r'^[a-zA-Z0-9+_.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  static const String _nameValidatorRegExp =
      r"^(\s)*[A-Za-z]+((\s)?((\'|\-)?([A-Za-z])+))*(\s)*$";

  static Map<String, bool> passwordValidation = <String, bool>{
    length: false,
    digit: false,
    uppercase: false,
    lowercase: false,
    specialChar: false,
    noSpace: false
  };

  static bool getPasswordValidationReport(String password) {
    passwordValidation[length] = password.length >= 8;
    passwordValidation[lowercase] = password.contains(RegExp(r'[a-z]'));
    passwordValidation[uppercase] = password.contains(RegExp(r'[A-Z]'));
    passwordValidation[digit] = password.contains(RegExp(r'[0-9]'));
    passwordValidation[specialChar] =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    passwordValidation[noSpace] =
        password.isNotEmpty && !password.contains(RegExp(' '));

    bool isValid = passwordValidation.entries.every((element) => element.value);

    return isValid;
  }

}
