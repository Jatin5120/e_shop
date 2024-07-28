class AppExceptions implements Exception {
  AppExceptions(this.message, [this.details]);
  final String message;
  final String? details;

  @override
  String toString() => details != null ? '$message: $details' : message;
}

class AuthException extends AppExceptions {
  AuthException(super.message, [super.details]);
}

class FirestoreException extends AppExceptions {
  FirestoreException(super.message, [super.details]);
}
