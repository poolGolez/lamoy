import 'package:flutter/material.dart';
import 'package:lamoy/screen/home_screen.dart';
import 'package:lamoy/screen/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const ROUTE_NAME = '/filters';

  final Map<String, bool> filters;
  final Function saveFilters;

  const FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.filters['glutenFree'];
    _lactoseFree = widget.filters['lactoseFree'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    super.initState();
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Save Filters',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {
                        widget.saveFilters(
                          glutenFree: _glutenFree,
                          lactoseFree: _lactoseFree,
                          vegetarian: _vegetarian,
                          vegan: _vegan,
                        );
                        Navigator.of(context)
                            .pushReplacementNamed(HomeScreen.ROUTE_NAME);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

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
}
