import 'package:flutter/material.dart';

import '../domain/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const ROUTE_NAME = '/meals';

  Widget _buildSectionTitle(context, title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildSectionList(list, itemBuilder, {double listHeight = 150.0}) {
    return Container(
      height: listHeight,
      width: 350,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: ListView.builder(
        itemBuilder: (_, index) => itemBuilder(list[index], index),
        itemCount: list.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(context, 'Ingredients'),
            _buildSectionList(
              meal.ingredients,
              (ingredient, _) {
                return Container(
                  width: 300,
                  margin: const EdgeInsets.all(2),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(ingredient),
                );
              },
            ),
            _buildSectionTitle(context, 'Steps'),
            _buildSectionList(meal.steps, (step, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Theme.of(context).accentColor,
                    ),
                    title: Text(step),
                  ),
                  Divider(),
                ],
              );
            }, listHeight: 200),
          ],
        ),
      ),
    );
  }
}
