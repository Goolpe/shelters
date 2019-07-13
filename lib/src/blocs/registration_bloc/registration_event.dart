import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {
  RegistrationEvent([List<dynamic> props = const <dynamic>[]]) : super(props);
}

class RegistrationButtonPressed extends RegistrationEvent {
  RegistrationButtonPressed({
    @required this.username,
    @required this.password,
    @required this.name,
    @required this.surname,
    @required this.phone,
    @required this.email,
    @required this.context,
  }) : super(<dynamic>[
    username, 
    password, 
    name,
    surname,
    phone,
    email,
    context
  ]);

  final String username;
  final String password;
  final BuildContext context;
  final String name;
  final String surname;
  final String phone;
  final String email;

  @override
  String toString() =>
      'RegistrationButtonPressed { username: $username, password: $password, context: $context}';
}