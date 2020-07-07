import 'package:flutter/material.dart';
import '../domain/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Center(
        child: Text('Inside category meals screen'),
      ),
    );
  }
}
