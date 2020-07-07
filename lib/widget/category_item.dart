import 'package:flutter/material.dart';

import '../domain/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key key, this.category}) : super(key: key);

  void navigateToCategoryMealsScreen(context) {
    Navigator.of(context).pushNamed('/category-meals', arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToCategoryMealsScreen(context),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amber.withOpacity(0.3),
              Colors.red,
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
