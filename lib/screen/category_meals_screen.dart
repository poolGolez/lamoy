import 'package:flutter/material.dart';

import '../domain/category.dart';
import '../domain/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Center(
        child: Column(
          children: meals.map((meal) {
            return Text(meal.title);
          }).toList(),
        ),
      ),
    );
  }
}
