import 'package:flutter/material.dart';
import 'package:lamoy/screen/meal_details_screen.dart';

import './screen/home_screen.dart';
import './screen/category_meals_screen.dart';
import './screen/filters_screen.dart';

void main() => runApp(LamoyApp());

class LamoyApp extends StatefulWidget {
  @override
  _LamoyAppState createState() => _LamoyAppState();
}

class _LamoyAppState extends State<LamoyApp> {
  final _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegetarian': false,
    'vegan': false,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amberAccent,
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
        FiltersScreen.ROUTE_NAME: (ctx) => FiltersScreen(_filters, saveFilters),
      },
    );
  }

  void saveFilters({
    @required bool glutenFree,
    @required bool lactoseFree,
    @required bool vegetarian,
    @required bool vegan,
  }) {
    _filters['glutenFree'] = glutenFree;
    _filters['lactoseFree'] = lactoseFree;
    _filters['vegetarian'] = vegetarian;
    _filters['vegan'] = vegan;
  }
}
