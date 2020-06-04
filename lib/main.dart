import 'package:bot_toast/bot_toast.dart';
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
  final SharedPreferences _shPreferences = await SharedPreferences.getInstance();
  final String _locale = _shPreferences.getString('locale') ?? 'en';

  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: FileTranslationLoader(
      useCountryCode: false,
      fallbackFile: 'en',
      forcedLocale: Locale(_locale),
    )
  );
  
  // // //set time localization
  timeago.setLocaleMessages(_locale, selectLocale(_locale));

  runApp(MyApp(
    flutterI18nDelegate: flutterI18nDelegate,
    locale: _locale
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    this.flutterI18nDelegate,
    this.locale
  });

  final FlutterI18nDelegate flutterI18nDelegate;
  final String locale;

  @override
  Widget build(BuildContext context) {

    final botToastBuilder = BotToastInit();
    TextTheme _textTheme = GoogleFonts.playTextTheme(
      Theme.of(context).textTheme
    );
    
    return MultiProvider(
      providers: <ChangeNotifierProvider<dynamic>>[
        ChangeNotifierProvider<ThemeProvider>(
          create: (BuildContext context) => ThemeProvider()..init(context),
        ),
        ChangeNotifierProvider<AuthorizationProvider>(
          lazy: false,
          create: (BuildContext context) => AuthorizationProvider()..init(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (BuildContext context) => LoginProvider(),
        ),
        ChangeNotifierProvider<NavigationProvider>(
          create: (BuildContext context) => NavigationProvider(),
        ),
        ChangeNotifierProvider<AnimalsProvider>(
          create: (BuildContext context) => AnimalsProvider()..init(),
        ),
        ChangeNotifierProvider<AddAnimalProvider>(
          create: (BuildContext context) => AddAnimalProvider()..init(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          create: (BuildContext context) => SettingsProvider(),
        ),
        ChangeNotifierProvider<CarouselProvider>(
          create: (BuildContext context) => CarouselProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeState, snapshot) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shelters',
            navigatorObservers: [BotToastNavigatorObserver()],
            theme: themeState.darkTheme
            ? ThemeData.dark().copyWith(
              accentColor: const Color(0xff306060),
              splashColor: Theme.of(context).splashColor,
              appBarTheme: AppBarTheme(
                elevation: 0
              )
            )
            : ThemeData(
              primaryColor: const Color(0xff416c6d),
              accentColor: const Color(0xff306060),
              splashColor: const Color(0xff83b1af),
              scaffoldBackgroundColor: const Color(0xfff6f6f6),
              backgroundColor: const Color(0xffdfe4ea),
              appBarTheme: AppBarTheme(
                color: Colors.white,
                textTheme: _textTheme,
                iconTheme: const IconThemeData(color: Colors.black),
                elevation: 0
              )
            ),
            builder: (BuildContext context, Widget child) {
              child = ScrollConfiguration(
                behavior: PortfolioOverScrollBehavior(),
                child: child,
              );
              child = botToastBuilder(context,child);
              return child;
            },
            locale: Locale(locale),
            localizationsDelegates: [
              flutterI18nDelegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', 'US'),
              const Locale('ru', 'RU'),
            ],
            home: HomeScreen()
          );
        }
      ),
    );
  }
}
