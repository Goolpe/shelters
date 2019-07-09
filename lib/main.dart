import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:shelters/src/blocs/blocs.dart';
import 'package:shelters/src/components/components.dart';
import 'package:shelters/src/screens/login/login.dart';
import 'package:shelters/src/screens/profile/my_location.dart';
import 'package:shelters/src/screens/search_list/donor.dart';
import 'package:shelters/src/screens/search_list/exhibitions.dart';
import 'package:shelters/src/screens/search_list/lost.dart';
import 'package:shelters/src/screens/search_list/shelters.dart';
import 'package:shelters/src/screens/navigation.dart';
import 'package:shelters/src/screens/profile/about_app.dart';
import 'package:shelters/src/screens/profile/my_pets.dart';
import 'package:shelters/src/localization/localization.dart';

void main() => runApp(AppSh());

class AppSh extends StatefulWidget {
  @override
  _AppShState createState() =>  _AppShState();
}

class _AppShState extends State<AppSh> {
  final NavigationBloc _navigationBloc = NavigationBloc();
  final SortBloc _sortBloc = SortBloc();
  final SearchBloc _searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<NavigationBloc>(bloc: _navigationBloc),
        BlocProvider<SortBloc>(bloc: _sortBloc),
        BlocProvider<SearchBloc>(bloc: _searchBloc)
      ],
      child: DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (Brightness brightness) => ThemeData(
          brightness: brightness,
          primarySwatch: Colors.blue,
          primaryTextTheme: Theme
          .of(context)
          .primaryTextTheme
          .apply(bodyColor: brightness == Brightness.light
              ? Colors.black
              : Colors.white),
          primaryIconTheme: 
            Theme.of(context).primaryIconTheme.copyWith(
              color: brightness == Brightness.light
              ? Colors.black
              : Colors.white
            )
        ),
        themedWidgetBuilder: (BuildContext context, ThemeData theme) {
          return MaterialApp(
            builder: (context, child){
              return ScrollConfiguration(
                behavior: CustomBehaviorSh(),
                child: child
              );
            },
            localizationsDelegates: [
              const CustomLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', ''),
              const Locale('ru', ''),
            ],
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (BuildContext context) => 
              CustomLocalizations.of(context).apptTitle,
            theme: theme,
            onGenerateRoute: (RouteSettings settings) => 
              _handleRoute(settings),
            home: LoginSh()
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    _navigationBloc?.dispose();
    _searchBloc?.dispose();
    _sortBloc?.dispose();
    super.dispose();
  }

  Route<dynamic> _goTo(StatelessWidget widget){
    return CupertinoPageRoute<dynamic>(
      builder: (BuildContext context) => widget
    );
  }

  Route<dynamic> _handleRoute(RouteSettings settings){
    switch (settings.name){
      case '/shelters': 
        return _goTo(SheltersSh());
      case '/lost': 
        return _goTo(LostSh());
      case '/exhibitions':
        return _goTo(ExhibitionsSh());
      case '/donor': 
        return _goTo(DonorSh());
      case '/about_app': 
        return _goTo(AboutAppSh());
      case '/my_pets': 
        return _goTo(MyPetsSh());
      case '/my_location': 
        return _goTo(MyLocationSh());
      case '/home': 
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => NavigationSh()
        );
      case '/login': 
        return CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => LoginSh()
        );
      default:
        return null;
    }
  }
}