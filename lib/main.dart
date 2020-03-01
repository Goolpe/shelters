import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelters/shelf.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  // BlocSupervisor.delegate = SimpleBlocDelegate();

  final animalsModel = AnimalsModel();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SlidingPanelBloc>(
          create: (context) => SlidingPanelBloc()..add(SlidingPanelStarted()),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider<FindBloc>(
          create: (context) => FindBloc(),
        ),
        BlocProvider<FindPersonBloc>(
          create: (context) => FindPersonBloc()..add(FindPersonStarted()),
        ),
        BlocProvider<SettingsPanelBloc>(
          create: (context) => SettingsPanelBloc()..add(SettingsPanelStarted()),
        ),
        BlocProvider<AnimalsBloc>(
          create: (context) => AnimalsBloc(
            animalsModel: animalsModel
          ),
        )
      ],
      child: App()
    )
  );
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Navigation(),
            AnimalPanel(),
            SettingsPanel()
          ]
        )
      )
    );
  }
}