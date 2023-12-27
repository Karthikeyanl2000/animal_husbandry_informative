import 'package:animal_husbandry/view/main_screen.dart';
import 'package:animal_husbandry/widgets/pageRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en',
      supportedLocales: ['en', 'ta'],
      basePath: 'assets/i18n/',
  );
  runApp(LocalizedApp(delegate, const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: myRoutes(context),
      title: 'Animal Husbandry',
      localizationsDelegates: [
        localizationDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: localizationDelegate.supportedLocales,
      locale: localizationDelegate.currentLocale,
      theme: ThemeData(
        appBarTheme:  AppBarTheme(
          color: Colors.blue.withOpacity(0.3),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
