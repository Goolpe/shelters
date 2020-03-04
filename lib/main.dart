import 'package:flutter/material.dart';
import 'package:shelters/shelf.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthModel()..init()),
        ChangeNotifierProvider(create: (_) => NavigationModel()),
        ChangeNotifierProvider(create: (_) => CreateModel()),
        ChangeNotifierProvider(create: (_) => AnimalPanelModel()),
        ChangeNotifierProvider(lazy: false, create: (_) => AnimalsListModel()..init()),
        ChangeNotifierProvider(create: (_) => SettingsPanelModel()),
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
      home: Consumer<AuthModel>(
        builder: (context, state, _){
          return state.authStatus
          ? NavigationScreen()
          : LoginScreen();
        }
      )
    );
  }
}