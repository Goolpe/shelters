import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';
import 'src/screens/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PanelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarouselProvider(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shelters',
        theme: ThemeData(
          primaryColor: Color(0xff416c6d),
          accentColor: Color(0xff306060),
          textTheme: GoogleFonts.novaSlimTextTheme(
            Theme.of(context).textTheme
          )
        ),
        builder: (BuildContext context, Widget child) {
          return ScrollConfiguration(
            behavior: PortfolioOverScrollBehavior(),
            child: child
          );
        },
        home: MenuScreen(),
      ),
    );
  }
}