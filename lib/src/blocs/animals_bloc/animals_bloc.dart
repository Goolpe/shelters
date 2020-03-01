import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:shelters/shelf.dart';

class AnimalsBloc extends Bloc<AnimalsEvent, AnimalsState>{
  AnimalsBloc({
    @required this.animalsModel
  }) : assert(animalsModel != null);

  final AnimalsModel animalsModel;

  AnimalsModel listOld;

  @override
  AnimalsState get initialState => AnimalsUninitial();

  @override
  Stream<AnimalsState> mapEventToState(AnimalsEvent event) async* {
    if(event is AnimalsFetch){
      yield* _mapAnimalsFetchToState(event);
    }
  }

  Stream<AnimalsState> _mapAnimalsFetchToState(event) async* {
    if(listOld == null || listOld.list.isEmpty){
      yield AnimalsLoading();
      listOld = await animalsModel.fetchAnimalList();
    } else {
      yield AnimalsSuccess(data: listOld);
      AnimalsModel list = await animalsModel.fetchAnimalList();
      if(list != listOld){
        listOld = list;
      }
    }
    yield AnimalsSuccess(data: listOld);
  }
}
