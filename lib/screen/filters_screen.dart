import 'package:flutter/material.dart';
import 'package:lamoy/screen/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const ROUTE_NAME = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  Widget _settingSwitch({
    String title,
    String description,
    bool value,
    Function handler,
  }) {
    return SwitchListTile(
      title: Text(title, style: Theme.of(context).textTheme.headline6),
      subtitle: Text(description),
      value: value,
      onChanged: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              padding: const EdgeInsets.all(20),
              child: Text("Adjust your meal selection",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _settingSwitch(
                    title: 'Gluten-Free',
                    description: 'Include only gluten-free meals.',
                    value: _glutenFree,
                    handler: (newValue) => setState(() {
                      _glutenFree = newValue;
                    }),
                  ),
                  _settingSwitch(
                    title: 'Lactose-Free',
                    description: 'Include only lactose-free meals.',
                    value: _lactoseFree,
                    handler: (newValue) => setState(() {
                      _lactoseFree = newValue;
                    }),
                  ),
                  _settingSwitch(
                    title: 'Vegetarian',
                    description: 'Include only vegetarian meals.',
                    value: _vegetarian,
                    handler: (newValue) => setState(() {
                      _vegetarian = newValue;
                    }),
                  ),
                  _settingSwitch(
                    title: 'Vegan',
                    description: 'Include only vegan meals.',
                    value: _vegan,
                    handler: (newValue) => setState(() {
                      _vegan = newValue;
                    }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
