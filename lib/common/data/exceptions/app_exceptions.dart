class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return prefix != null ? '$prefix: $message' : message ?? 'Unknown Error';
  }
}

class InternetException extends AppException {
  InternetException([String? message])
    : super(message, 'No Internet Connection');
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? message])
    : super(message, 'Request Timeout');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal Server Error');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, 'Invalid URL');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Fetch Data Error');
}
