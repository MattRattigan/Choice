
abstract class BasePasswordException implements Exception {
  BasePasswordException(this.message);
  final String message;

  @override
  String toString() => message;
}

class ShortPasswordException extends BasePasswordException {
  ShortPasswordException(String message) : super(message);
}

class NoNumberException extends BasePasswordException {
  NoNumberException(String message) : super(message);
}

class NoUppercaseException extends BasePasswordException {
  NoUppercaseException(String message) : super(message);
}

class NoLowercaseException extends BasePasswordException {
  NoLowercaseException(String message) : super(message);
}


