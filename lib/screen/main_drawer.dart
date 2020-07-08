import 'package:flutter/material.dart';

import './filters_screen.dart';
import './home_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _drawerItem(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          _drawerItem('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.ROUTE_NAME);
          }),
          _drawerItem('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.ROUTE_NAME);
          }),
        ],
      ),
    );
  }
}
