import 'package:equatable/equatable.dart';

class PersonModel extends Equatable{
  String firstName;
  String lastName;
  DateTime dateOfBirth;
  DateTime dateOfLoss;
  
  PersonModel({
    this.firstName = '',
    this.lastName = '',
    this.dateOfBirth,
    this.dateOfLoss
  }) : assert(firstName!=null),
    assert(lastName!=null),
    super([firstName,lastName,dateOfBirth,dateOfLoss]);

  PersonModel copyWith(PersonModel person){
    return PersonModel(
      firstName: person.firstName ?? this.firstName,
      lastName: person.lastName ?? this.lastName,
      dateOfBirth: person.dateOfBirth ?? this.dateOfBirth,
      dateOfLoss: person.dateOfLoss ?? this.dateOfLoss,
    );
  }

  @override
  List get props => [
    firstName,
    lastName,
    dateOfBirth,
    dateOfLoss
  ];

  @override
  String toString() {
    return 'PersonModel {'
      'firstName: $firstName,'
      'lastName: $lastName,'
      'dateOfBirth: $dateOfBirth,'
      'dateOfLoss: $dateOfLoss}';
  }
}