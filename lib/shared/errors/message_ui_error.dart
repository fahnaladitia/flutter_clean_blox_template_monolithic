part of 'errors.dart';

class MessageUIError extends UIError {
  const MessageUIError({required super.message, required super.code});

  @override
  List<Object> get props => [message, code];

  @override
  String toString() {
    return 'MessageUIError(message: $message, code: $code)';
  }
}
