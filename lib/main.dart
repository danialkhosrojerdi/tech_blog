import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/Screens/splash_screen.dart';
import 'package:tech_blog/constants/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تک بلاگ',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Persian
      ],
      theme: ThemeData(
        fontFamily: 'dana',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: SolidColors.posterTitle,
          ),
          titleMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          titleSmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
