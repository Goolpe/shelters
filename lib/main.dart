import 'package:flutter/material.dart';
import 'package:shelters/shelf.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationModel()),
        ChangeNotifierProvider(create: (_) => CreateModel()),
        ChangeNotifierProvider(create: (_) => AnimalPanelModel()),
        ChangeNotifierProvider(create: (_) => AnimalsListModel()),
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