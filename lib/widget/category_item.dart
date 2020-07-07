import 'package:flutter/material.dart';

import '../domain/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(category.title),
      decoration: BoxDecoration(
        color: Colors.purple,
      ),
    );
  }
}
