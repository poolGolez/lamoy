import 'package:flutter/material.dart';
import 'package:lamoy/screen/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const ROUTE_NAME = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters Screen!'),
      ),
    );
  }
}
