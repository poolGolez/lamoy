import 'package:flutter/material.dart';
import './category_item.dart';

import '../domain/category.dart';
import '../domain/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  List<Category> get categories => DUMMY_CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lamoy bai')),
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: categories.map((category) {
          return CategoryItem(category: category);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
