import 'dart:async';
import 'package:bloc/bloc.dart';

enum NavigationEvent { first, second, third }

class NavigationBloc extends Bloc<NavigationEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(
    NavigationEvent event,
  ) async* {
    switch (event) {
      case NavigationEvent.first:
        yield 0;
        break;
      case NavigationEvent.second:
        yield 1;
        break;
      case NavigationEvent.third:
        yield 2;
        break;
    }
  }
}
