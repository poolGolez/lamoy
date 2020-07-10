import 'package:flutter/material.dart';

import '../domain/category.dart';
import '../domain/dummy_data.dart';
import '../domain/meal.dart';
import '../widget/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const ROUTE_NAME = '/category-meals';

  Map<String, bool> _filters;

  CategoryMealsScreen(Map<String, bool> this._filters);

  List<Meal> mealsByCategory(Category category) {
    return DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id) && _passessFilter(meal);
    }).toList();
  }

  bool _passessFilter(meal) {
    if(_filters['glutenFree'] && !meal.isGlutenFree) {
      return false;
    }

    if(_filters['lactoseFree'] && !meal.isLactoseFree) {
      return false;
    }

    if(_filters['vegetarian'] && !meal.isVegetarian) {
      return false;
    }

    if(_filters['vegan'] && !meal.isVegan) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;
    final meals = mealsByCategory(category);

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: SingleChildScrollView(
        child: Column(
          children: meals.map((meal) {
            return MealItem(meal: meal);
          }).toList(),
        ),
      ),
    );
  }
}
