import 'dart:async';
import 'package:bloc/bloc.dart';

enum ExitEvent {no, yes}

class ExitBloc extends Bloc<ExitEvent, bool> {
  @override
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(
    ExitEvent event,
  ) async* {
    switch (event) {
      case ExitEvent.no:
        yield false;
        break;
      case ExitEvent.yes:
        yield true;
        break;
    }
  }
}
