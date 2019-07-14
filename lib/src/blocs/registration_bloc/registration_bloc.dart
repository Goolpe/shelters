import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:shelters/shelf.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  @override
  RegistrationState get initialState => RegistrationInitial();

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegistrationButtonPressed) {
      yield RegistrationLoading();

      try {
        final String token = await userRepository.registration(
          username: event.username,
          password: event.password,
          name: event.name,
          surname: event.surname,
          phone: event.phone,
          email: event.email,
          context: event.context
        );
        
        authenticationBloc.dispatch(LoggedIn(token: token));
        Navigator.pop(event.context);

        yield RegistrationInitial();
      } catch (error) {
        yield RegistrationFailure(error: error.toString());
      }
    }
  }
}