import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {
  RegistrationState([List<dynamic> props = const <dynamic>[]]) : super(props);
}

class RegistrationInitial extends RegistrationState {
  @override
  String toString() => 'RegistrationInitial';
}

class RegistrationLoading extends RegistrationState {
  @override
  String toString() => 'RegistrationLoading';
}

class RegistrationFailure extends RegistrationState {
  RegistrationFailure({@required this.error}) : super(<dynamic>[error]);

  final String error;

  @override
  String toString() => 'RegistrationFailure { error: $error }';
}