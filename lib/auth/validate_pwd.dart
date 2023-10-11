import 'package:no_name_app/auth/exceptions_pwd.dart';

mixin ValidatePwd {
  String? validateEmptyText(String? text) {
    if (text == null || text.isEmpty) {
      return 'Please Enter Value';
    }
  }

  void validateLength(String? password) {
    final goodLength = RegExp(r'.{12,}');
    if (!password!.contains(goodLength)) {
      throw ShortPasswordException('Password must be at least 12 characters');
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
      validateEmptyText(password);
      validateLength(password);
      validateLowercase(password);
      validateUppercase(password);
      validateNumber(password);
    } on ShortPasswordException catch (e) {
      print("\nHello\n");
      return e.toString();
    } on NoLowercaseException catch (e) {
      return e.toString();
    } on NoUppercaseException catch (e) {
      return e.toString();
    } on NoNumberException catch (e) {
      return e.toString();
    }
    return password;
  }
}
