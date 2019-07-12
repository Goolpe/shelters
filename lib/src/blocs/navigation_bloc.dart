import 'dart:async';
import 'package:bloc/bloc.dart';

enum NavigationEvent { one, two, three, four, five }

class NavigationBloc extends Bloc<NavigationEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(NavigationEvent event) async* {
    switch (event) {
      case NavigationEvent.one:
        yield 0;
        break;
      case NavigationEvent.two:
        yield 1;
        break;
      case NavigationEvent.three:
        yield 2;
        break;
      case NavigationEvent.four:
        yield 3;
        break;
      case NavigationEvent.five:
        yield 4;
        break;
    }
  }
}
