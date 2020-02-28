import 'package:equatable/equatable.dart';

abstract class AnimalsEvent extends Equatable{
  AnimalsEvent();

  @override
  List get props => [];
}

class AnimalsFetch extends AnimalsEvent{}