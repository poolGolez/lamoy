import 'package:flutter/material.dart';

import '../domain/meal.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  FavoritesScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text('No meals marked as favorite'),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: _favoriteMeals.map((meal) {
            return MealItem(meal: meal);
          }).toList(),
        ),
      );
    }
  }
}
