import 'dart:async';
import 'package:bloc/bloc.dart';

enum SortEvent {list, grid}

class SortBloc extends Bloc<SortEvent, bool> {
  @override
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(
    SortEvent event,
  ) async* {
    switch (event) {
      case SortEvent.list:
        yield false;
        break;
      case SortEvent.grid:
        yield true;
        break;
    }
  }
}
