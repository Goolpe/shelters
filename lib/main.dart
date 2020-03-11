import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelters/shelf.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('en', SheltersTimeAgo());
  
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool themeMode = pref.getBool('theme') ?? true;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthNotifier()..init()),
        ChangeNotifierProvider(create: (_) => NavigationNotifier()),
        ChangeNotifierProvider(create: (_) => CreateNotifier()..init()),
        ChangeNotifierProvider(create: (_) => AnimalPanelNotifier()),
        ChangeNotifierProvider(create: (_) => AnimalsNotifier()..init()),
        ChangeNotifierProvider(create: (_) => SettingsPanelNotifier()),
        ChangeNotifierProvider(create: (_) => BottomPanelNotifier()),
        ChangeNotifierProvider(create: (_) => ThemeNotifier(themeMode ? lightTheme : darkTheme)),
      ],
      child: App()
    )
  );
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _themeModel = Provider.of<ThemeNotifier>(context);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeModel.themeData,
      home: Consumer<AuthNotifier>(
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