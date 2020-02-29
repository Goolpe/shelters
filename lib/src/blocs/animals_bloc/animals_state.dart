import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:shelters/shelf.dart';

abstract class AnimalsState extends Equatable{
  AnimalsState();

  @override
  List get props => [];
}

class AnimalsUninitial extends AnimalsState{}

class AnimalsLoading extends AnimalsState{}

class AnimalsSuccess extends AnimalsState{
  AnimalsSuccess({@required this.data});

  AnimalsModel data;
}