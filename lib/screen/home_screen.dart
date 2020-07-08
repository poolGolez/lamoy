import 'package:flutter/material.dart';
import 'package:lamoy/screen/categories_screen.dart';
import 'package:lamoy/screen/favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;
  List _screens = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  Widget get selectedScreen => _screens[_selectedScreenIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lamoy ta bai'),
      ),
      body: selectedScreen,
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
