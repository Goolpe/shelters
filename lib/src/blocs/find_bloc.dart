import 'package:flutter_bloc/flutter_bloc.dart';

enum FindType {none, person, animal}

class FindBloc extends Bloc<FindType, FindType>{

  @override
  FindType get initialState => FindType.none;

  @override
  Stream<FindType> mapEventToState(FindType event) async* {
    yield event;
  }
}

