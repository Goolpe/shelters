import 'dart:async';
import 'package:bloc/bloc.dart';

enum SearchEvent {hide, show}

class SearchBloc extends Bloc<SearchEvent, bool> {
  @override
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(
    SearchEvent event,
  ) async* {
    switch (event) {
      case SearchEvent.hide:
        yield false;
        break;
      case SearchEvent.show:
        yield true;
        break;
    }
  }
}
