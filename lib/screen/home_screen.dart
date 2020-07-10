import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import './main_drawer.dart';
import '../domain/meal.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = '/';

  final List<Meal> favoriteMeals;

  HomeScreen(this.favoriteMeals);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex;
  List<Widget> _screens;

  @override
  void initState() {
    _selectedScreenIndex = 0;
    _screens = <Widget>[
      CategoriesScreen(),
      FavoritesScreen(widget.favoriteMeals),
    ];

    super.initState();
  }

  Widget get selectedScreen => _screens[_selectedScreenIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lamoy ta bai'),
      ),
      body: selectedScreen,
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: (index) => setState(() => _selectedScreenIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
