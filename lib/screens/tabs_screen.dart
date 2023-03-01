import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tuto_flutter/screens/categories_screen.dart';
import 'package:tuto_flutter/screens/favorites_screen.dart';
import 'package:tuto_flutter/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoritedMeals;

  TabsScreen(this.favoritedMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   late List<Map<String,dynamic>> _pages;
  @override
  void initState() {
    _pages=[
      {'page': CategoriesScreen(),'title':'Categories'},
      {'page': FavoritesScreen(widget.favoritedMeals),'title':'Your Favorites'}
    ];
    super.initState();
  }

  int _selectedPageIndex=0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']
        ),
    ),
    drawer: MainDrawer(),
    body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage ,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.category),
            label: 'Categories'
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.star),
              label: 'Favorites'
          )
        ],
    ),

    );
  }
}
