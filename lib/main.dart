import 'package:flutter/material.dart';

import './widget/categories_screen.dart';

void main() => runApp(LamoyApp());

class LamoyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amberAccent,
          // canvasColor: Colors.lightGreen[100]
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )),
      home: CategoriesScreen(),
    );
  }
}
