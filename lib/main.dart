import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:shelters/shelf.dart';

void main(){

  final UserRepository userRepository = UserRepository();

  runApp(
    MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<NavigationBloc>(
          builder: (BuildContext context) =>
            NavigationBloc()
        ),
        BlocProvider<ExitBloc>(
          builder: (BuildContext context) =>
            ExitBloc()
        ),
        BlocProvider<SortBloc>(
          builder: (BuildContext context) =>
            SortBloc()
        ),
        BlocProvider<AuthenticationBloc>(
          builder: (BuildContext context) =>
              AuthenticationBloc(userRepository: userRepository)..dispatch(AppStarted())
        ),
        BlocProvider<LoginBloc>(
          builder: (BuildContext context) =>
            LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository,
            )
        ),
        BlocProvider<RegistrationBloc>(
          builder: (BuildContext context) =>
            RegistrationBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository,
            )
        ),
      ],
      child: AppSh()
    )
  );
}

class AppSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
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
          return  OverlaySupport(
            child: MaterialApp(
              localizationsDelegates: [
                const CustomLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const <Locale>[
                Locale('en', ''),
                Locale('ru', ''),
              ],
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (BuildContext context) => 
                CustomLocalizations.of(context).apptTitle,
              theme: theme,
              onGenerateRoute: (RouteSettings settings) => 
                _handleRoute(settings),
              home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
                bloc: BlocProvider.of<AuthenticationBloc>(context),
                builder: (BuildContext context, AuthenticationState state) {
                  if (state is AuthenticationAuthenticated) {
                    return NavigationSh();
                  }
                  if (state is AuthenticationUnauthenticated) {
                    return LoginSh();
                  }
                  return Container(color: Colors.white);
                }
              )
            )
          );
        }
      );
  }

  Route<dynamic> _goTo(Widget widget){
    return CupertinoPageRoute<dynamic>(
      builder: (BuildContext context) => widget
    );
  }

  Route<dynamic> _handleRoute(RouteSettings settings){
    switch (settings.name){
      case '/pets': 
        return _goTo(const PetsListSh(title: 'Животные'));
      case '/lost': 
        return _goTo(const PetsListSh(title: 'Потеряшки'));
      case '/pet_card': 
        return _goTo(PetCardSh());
      case '/exhibitions':
        return _goTo(ExhibitionsSh());
      case '/donor': 
        return _goTo(DonorSh());
      case '/my_pets': 
        return _goTo(MyPetsSh());
      case '/my_location': 
        return _goTo(MyLocationSh());
      default:
        return null;
    }
  }
}