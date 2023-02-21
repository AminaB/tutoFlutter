
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/categories_screen.dart';
import 'package:tuto_flutter/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/':(ctx)=>const CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx)=>CategoryMealsScreen(),
      },
    );
  }
}
