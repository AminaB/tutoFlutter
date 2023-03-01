
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tuto_flutter/screens/category_meals_screen.dart';
import 'package:tuto_flutter/screens/filters_screen.dart';
import 'package:tuto_flutter/screens/tabs_screen.dart';
import 'package:tuto_flutter/widgets/meal_detail_screen.dart';

import 'dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten' : false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  bool _isMealFavorite(String id){
    return _favoritedMeals.any((element) =>element.id==id);
  }
  List<Meal> _favoritedMeals=[];
  List<Meal> _availableMeals=DUMMY_MEALS;
  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters=filterData;
      _availableMeals=DUMMY_MEALS.where((element) {
        if(_filters['gluten']==true && !element.isGlutenFree)
          return false;
        if(_filters['lactose']==true && !element.isLactoseFree)
          return false;
        if(_filters['vegan']==true && !element.isVegan)
          return false;
        if(_filters['vegetarian']==true && !element.isVegetarian)
          return false;
        return true;
      }).toList();
    });
  }
  void _toogleFavorite(String mealId){
     final existingIndex= _favoritedMeals.indexWhere((element) => mealId==element.id);
     if(existingIndex>=0){
       setState(() {
         _favoritedMeals.removeAt(existingIndex);
       });
     }else{
       setState(() {
         _favoritedMeals.add(DUMMY_MEALS.firstWhere((element) => mealId==element.id));
       });
     }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodySmall: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),

          ),
            bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1)
            ),
            titleSmall: const TextStyle(
                fontSize: 20,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold
            ),
            titleMedium: const TextStyle(
                fontSize: 25,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold
            ),
            titleLarge: const TextStyle(
                fontSize: 30,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold
            )
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),

      ),
      initialRoute: '/',
      routes: {
        '/':(ctx)=> TabsScreen(_favoritedMeals),
        CategoryMealsScreen.routeName: (ctx)=>CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName:(ctx)=>MealDetailScreen(_toogleFavorite,_isMealFavorite),
        FilterScreen.routeName:(ctx)=>FilterScreen(_filters,_setFilters),
      },
      onGenerateRoute: (settings) {
        // print(settings.arguments);
        // if(settings.name=='/meal-details'){
        //     return;
        // }else if(settings.name=='/something-else'){
        //   return;
        // }else{
        //   MaterialPageRoute(builder: (context) => CategoryMealsScreen(),);
        // }
      },
      onUnknownRoute:(settings) {
        MaterialPageRoute(builder: (context) => CategoryMealsScreen(_availableMeals),);
      },
    );
  }
}
