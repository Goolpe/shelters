import 'package:equatable/equatable.dart';
import 'package:shelters/shelf.dart';
import 'package:meta/meta.dart';

abstract class FindPersonState extends Equatable{
  FindPersonState(this.person):super([person]);
  final PersonModel person;

  @override
  List<Object> get props => [person];
}

class FindPersonUninitial extends FindPersonState{
  FindPersonUninitial():super(null);
}

class FindPersonInitial extends FindPersonState{
  FindPersonInitial({
    @required this.person
  }):super(person);

  final PersonModel person;

  @override
  List<PersonModel> get props => [person];

  @override
  String toString() => 'FindPersonInitial: {person: $person}';
}