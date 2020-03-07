import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelters/shelf.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('en', CustomEn());
  
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool themeMode = pref.getBool('theme') ?? true;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthModel()..init()),
        ChangeNotifierProvider(create: (_) => NavigationModel()),
        ChangeNotifierProvider(create: (_) => CreateModel()..init()),
        ChangeNotifierProvider(create: (_) => AnimalPanelModel()),
        ChangeNotifierProvider(create: (_) => AnimalsListModel()..init()),
        ChangeNotifierProvider(create: (_) => SettingsPanelModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel(themeMode ? lightTheme : darkTheme)),
      ],
      child: App()
    )
  );
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _themeModel = Provider.of<ThemeModel>(context);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeModel.themeData,
      home: Consumer<AuthModel>(
        builder: (context, state, _){
          if(state.authLoading){
            return Container(color: Colors.white);
          }
          return state.user != null
          ? HomeScreen()
          : LoginScreen();
        }
      )
    );
  }
}