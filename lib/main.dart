import 'package:Lesson2Creative/screens/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Creative2App());
}

class Creative2App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName : (context) => StartScreen(),

      },
    );
  }
}

