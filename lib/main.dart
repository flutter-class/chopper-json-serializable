import 'package:flutter/material.dart';
import 'package:network_example/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.red,
          elevation: 0.0,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontSize: 24.0
            )
          )
        )
      ),
      home: HomeScreen(),
    );
  }
}