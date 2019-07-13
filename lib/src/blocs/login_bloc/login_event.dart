import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List<dynamic> props = const <dynamic>[]]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed({
    @required this.username,
    @required this.password,
    @required this.context,
  }) : super(<dynamic>[username, password, context]);

  final String username;
  final String password;
  final BuildContext context;

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password, context: $context}';
}