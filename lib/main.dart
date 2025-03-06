import 'package:flutter/material.dart';
import 'package:layouting_exercise/views/first_screen.dart';
import 'package:layouting_exercise/views/second_screen.dart';
import 'package:layouting_exercise/views/splash/splash_screen.dart';
import 'package:layouting_exercise/views/splash/welcome/welcoming_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'baloo_2',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash' : (context) => SplashScreen(),
        '/' : (context) => FirstScreen(),
        '/second' : (context) => SecondScreen(),
        '/welcome' : (context) => WelcomingPage(),
      },
    );
  }
}

