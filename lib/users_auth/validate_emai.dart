

class EmailException implements Exception {
  EmailException(this.message) : super();
  String? message;

  @override
  String toString() => message!;
}

mixin ValidateEmail {
  void validateEmptyEmail(String? text) {
    if (text == null || text.isEmpty) {
      throw EmailException('Please Enter Value');
    }
  }

  void isValidEmail(String? email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(email!)) {
      throw EmailException("Please enter a valid email");
    }
  }

  String? validateEmailAddress(String? text) {
    try {
      validateEmptyEmail(text);
      isValidEmail(text);
      return null;
    } on EmailException catch (e) {
      return e.toString();
    }
  }
}
