import 'package:flutter/material.dart';

import '../domain/category.dart';
import '../domain/dummy_data.dart';
import '../widget/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const ROUTE_NAME = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

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
