import 'package:flutter/material.dart';
import 'package:lamoy/screen/meal_details_screen.dart';

import './screen/home_screen.dart';
import './screen/category_meals_screen.dart';
import './screen/filters_screen.dart';

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
      home: HomeScreen(),
      routes: {
        '/category-meals': (ctx) => CategoryMealsScreen(),
        '/meals': (ctx) => MealDetailsScreen(),
        FiltersScreen.ROUTE_NAME: (ctx) => FiltersScreen(),
      },
    );
  }
}
