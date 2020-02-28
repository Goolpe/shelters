import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelters/shelf.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  
  final animalsModel = AnimalsModel();

  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider<AnimalsBloc>(
        builder: (context) => AnimalsBloc(
          animalsModel: animalsModel
        ),
      )
    ],
    child: App()));
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigation()
      );
  }
}