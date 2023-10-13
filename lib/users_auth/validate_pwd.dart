

import 'package:no_name_app/users_auth/exceptions_pwd.dart';

mixin ValidatePwd {
  void validateLength(String? password) {
    final goodLength = RegExp(r'.{10,}');
    if (!password!.contains(goodLength)) {
      throw ShortPasswordException('Password must be at least 10 characters');
    }
  }

  void validateLowercase(String? password) {
    final lowercase = RegExp(r'[a-z]');
    if (!password!.contains(lowercase)) {
      throw NoLowercaseException('Password must have a lowercase letter!');
    }
  }

  void validateUppercase(String? password) {
    final uppercase = RegExp(r'[A-Z]');
    if (!password!.contains(uppercase)) {
      throw NoUppercaseException('Password must have an uppercase letter!');
    }
  }

  void validateNumber(String? password) {
    final number = RegExp(r'[0-9]');
    if (!password!.contains(number)) {
      throw NoNumberException('Password must have a number!');
    }
  }

  String? validatePassword(String? password) {
    try {
      validateLength(password);
      validateLowercase(password);
      validateUppercase(password);
      validateNumber(password);
      return null;
    } on ShortPasswordException catch (e) {
      print("\nHello\n"); // TODO: remove this
      return e.toString();
    } on NoLowercaseException catch (e) {
      return e.toString();
    } on NoUppercaseException catch (e) {
      return e.toString();
    } on NoNumberException catch (e) {
      return e.toString();
    }
  }
}
