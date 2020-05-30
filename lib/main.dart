import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelters/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'src/screens/index.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //set app localization
  SharedPreferences _shPreferences = await SharedPreferences.getInstance();
  String _locale = _shPreferences.getString('locale') ?? 'en';
  
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      useCountryCode: false,
      fallbackFile: 'en',
      forcedLocale: Locale(_locale),
    )
  );

  //set time localization
  timeago.setLocaleMessages('ru', SheltersTime());

  runApp(MyApp(flutterI18nDelegate));
}

class MyApp extends StatelessWidget {
  MyApp(this.flutterI18nDelegate);

  final FlutterI18nDelegate flutterI18nDelegate;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PanelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarouselProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shelters',
        theme: ThemeData(
          primaryColor: Color(0xff416c6d),
          accentColor: Color(0xff306060),
          textTheme: GoogleFonts.novaFlatTextTheme(
            Theme.of(context).textTheme
          )
        ),
        builder: (BuildContext context, Widget child) {
          return ScrollConfiguration(
            behavior: PortfolioOverScrollBehavior(),
            child: child
          );
        },
        localizationsDelegates: [
          flutterI18nDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        home: MenuScreen(),
      ),
    );
  }
}