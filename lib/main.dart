import 'package:flutter/material.dart';

import './domain/dummy_data.dart';
import './screen/category_meals_screen.dart';
import './screen/filters_screen.dart';
import './screen/home_screen.dart';
import './screen/meal_details_screen.dart';
import 'domain/meal.dart';

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

  final _favoriteMeals = [...DUMMY_MEALS.sublist(3, 9)];

  bool isFavorite(Meal meal) {
    return _favoriteMeals.any((element) => element.id == meal.id);
  }

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
      home: HomeScreen(_favoriteMeals),
      routes: {
        CategoryMealsScreen.ROUTE_NAME: (ctx) => CategoryMealsScreen(_filters),
        MealDetailsScreen.ROUTE_NAME: (ctx) => MealDetailsScreen(isFavorite),
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
