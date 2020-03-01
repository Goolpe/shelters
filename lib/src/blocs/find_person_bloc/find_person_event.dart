import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shelters/shelf.dart';

abstract class FindPersonEvent extends Equatable{
  FindPersonEvent();

  @override
  List<Object> get props => [];
}

class FindPersonStarted extends FindPersonEvent{}

class FindPersonUpdated extends FindPersonEvent{
  FindPersonUpdated({
    @required this.person
  });
  
  final PersonModel person;

  @override
  List<Object> get props => [person];

  @override
  String toString() => 'FindPersonUpdated: {person: $person}';
}

class FindPersonFirstNameUpdated extends FindPersonEvent{
  FindPersonFirstNameUpdated({
    @required this.firstName
  });
  
  final String firstName;

  @override
  List<Object> get props => [firstName];

  @override
  String toString() => 'FindPersonFirstName: {firstName: $firstName}';
}

class FindPersonLastNameUpdated extends FindPersonEvent{
  FindPersonLastNameUpdated({
    @required this.lastName
  });
  
  final String lastName;

  @override
  List<Object> get props => [lastName];

  @override
  String toString() => 'FindPersonLastName: {lastName: $lastName}';
}

class FindPersonDateOfBirthUpdated extends FindPersonEvent{
  FindPersonDateOfBirthUpdated({
    @required this.dateOfBirth
  });
  
  final DateTime dateOfBirth;
  
  @override
  List<Object> get props => [dateOfBirth];

  @override
  String toString() => 'FindPersonDateOfBirth: {dateOfBirth: $dateOfBirth}';
}

class FindPersonDateOfLossUpdated extends FindPersonEvent{
  FindPersonDateOfLossUpdated({
    @required this.dateOfLoss
  });
  
  final DateTime dateOfLoss;

  @override
  List<Object> get props => [dateOfLoss];

  @override
  String toString() => 'FindPersonDateOfLoss: {dateOfLoss: $dateOfLoss}';
}