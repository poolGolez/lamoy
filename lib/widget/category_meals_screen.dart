import 'package:flutter/material.dart';
import '../domain/category.dart';

class CategoryMealsScreen extends StatelessWidget {

  final Category category;

  const CategoryMealsScreen({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Center(
        child: Text('Inside category meals screen'),
      ),
    );
  }
}
