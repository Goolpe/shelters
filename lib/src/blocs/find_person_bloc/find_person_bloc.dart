import 'package:bloc/bloc.dart';
import 'package:shelters/shelf.dart';

class FindPersonBloc extends Bloc<FindPersonEvent, FindPersonState>{

  PersonModel person;
  
  @override
  get initialState => FindPersonUninitial();

  @override
  Stream<FindPersonState> mapEventToState(event) async* {
    if(event is FindPersonStarted){
      yield* mapFindPersonStartedToState();
    } else if(event is FindPersonFirstNameUpdated){
      yield* mapFindPersonFirstNameUpdatedToState(event);
    } else if(event is FindPersonLastNameUpdated){
      yield* mapFindPersonLastNameUpdatedToState(event);
    } else if(event is FindPersonDateOfBirthUpdated){
      yield* mapFindPersonDateOfBirthUpdatedToState(event);
    } else if(event is FindPersonDateOfLossUpdated){
      yield* mapFindPersonDateOfLossUpdatedToState(event);
    } else if(event is FindPersonUpdated){
      yield* mapFindPersonUpdatedToState(event);
    }
  }

  Stream<FindPersonState> mapFindPersonStartedToState() async* {
    person = PersonModel();
    add(FindPersonUpdated(person: person));
  }

  Stream<FindPersonState> mapFindPersonFirstNameUpdatedToState(FindPersonFirstNameUpdated event) async* {
    person.firstName = event.firstName;
    add(FindPersonUpdated(person: person));
  }

  Stream<FindPersonState> mapFindPersonLastNameUpdatedToState(FindPersonLastNameUpdated event) async* {
    person.lastName = event.lastName;
    add(FindPersonUpdated(person: person));
  }

  Stream<FindPersonState> mapFindPersonDateOfBirthUpdatedToState(FindPersonDateOfBirthUpdated event) async* {
    PersonModel newPerson = PersonModel().copyWith(person);
    newPerson.dateOfBirth = event.dateOfBirth;

    add(FindPersonUpdated(person: newPerson));

    person.dateOfBirth = event.dateOfBirth;
  }

  Stream<FindPersonState> mapFindPersonDateOfLossUpdatedToState(FindPersonDateOfLossUpdated event) async* {
    person.dateOfLoss = event.dateOfLoss;
    add(FindPersonUpdated(person: person));
  }

  Stream<FindPersonState> mapFindPersonUpdatedToState(FindPersonUpdated event) async* {
    yield FindPersonInitial(
      person: person
    );
  }
}