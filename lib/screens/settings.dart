
import 'package:flutter/material.dart';
import 'package:meal/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final selectedFilters = {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
              }; widget.saveFilters(selectedFilters);}
              )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(child: ListView(
          children: [
            SwitchListTile(
                value: _glutenFree,
                title: Text('Gluten Free'),
                subtitle: Text('Only include gluten-free meals.'),
                onChanged: (newValue){
              setState(() {
                _glutenFree = newValue;
              });
            }),
            SwitchListTile(
                value: _lactoseFree,
                title: Text('Lactose Free'),
                subtitle: Text('Only include lactose-free meals.'),
                onChanged: (newValue){
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
            SwitchListTile(
                value: _vegetarian,
                title: Text('Vegetarian'),
                subtitle: Text('Only include vegetarian meals.'),
                onChanged: (newValue){
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
            SwitchListTile(
                value: _vegan,
                title: Text('Vegan'),
                subtitle: Text('Only include vegan meals.'),
                onChanged: (newValue){
                  setState(() {
                    _vegan = newValue;
                  });
                }),
          ],
          )
          )
        ],
      ),
    );
  }
}
