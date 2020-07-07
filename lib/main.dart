import 'package:flutter/material.dart';

import './widget/categories_screen.dart';

void main() => runApp(LamoyApp());

class LamoyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: CategoriesScreen(),
    );
  }
}
