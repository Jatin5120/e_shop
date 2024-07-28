import 'package:e_shop/res/res.dart';

class AppValidators {
  const AppValidators._();

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    final regex = RegExp(AppConstants.emailPattern);
    return regex.hasMatch(value) == true ? null : 'Invalid Email';
  }

  static String? userName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }

    if (!value.contains(RegExp('[a-z]'))) {
      return 'Password must contain atleast 1 lowercase character';
    }
    if (!value.contains(RegExp('[A-Z]'))) {
      return 'Password must contain atleast 1 uppercase character';
    }
    if (!value.contains(RegExp('[0-9]'))) {
      return 'Password must contain atleast 1 number';
    }
    if (!value.contains(RegExp('[^((0-9)|(a-z)|(A-Z)|)]'))) {
      return 'Password must contain atleast 1 special symbol';
    }
    if (value.length < 8) {
      return 'Password must contain atleast 8 characters';
    }

    return null;
  }
}
