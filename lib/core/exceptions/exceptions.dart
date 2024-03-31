import 'package:equatable/equatable.dart';

class ErrorException extends Equatable implements Exception {
  final String? message;

  const ErrorException({required this.message});

  @override
  List<Object?> get props => [message];
}

class NotFoundException extends ErrorException {
  const NotFoundException({required super.message});
}