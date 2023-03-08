
import 'package:flutter/material.dart';
import 'package:tuto_flutter/screens/products_overview_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.orange),
        fontFamily: 'OpenSans',
      ),
      // /*  canvasColor: Color.fromRGBO(255, 254, 229, 1),
      //   fontFamily: 'OpenSans',
      //   textTheme: ThemeData.light().textTheme.copyWith(
      //     bodySmall: TextStyle(
      //       color: Color.fromRGBO(20, 51, 51, 1),
      //
      //     ),
      //       bodyMedium: const TextStyle(
      //           color: Color.fromRGBO(20, 51, 51, 1)
      //       ),
      //       titleSmall: const TextStyle(
      //           fontSize: 20,
      //           fontFamily: 'Quicksand',
      //           fontWeight: FontWeight.bold
      //       ),
      //       titleMedium: const TextStyle(
      //           fontSize: 25,
      //           fontFamily: 'Quicksand',
      //           fontWeight: FontWeight.bold
      //       ),
      //       titleLarge: const TextStyle(
      //           fontSize: 30,
      //           fontFamily: 'Quicksand',
      //           fontWeight: FontWeight.bold
      //       )
      //   ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),*//*
      //
      // ),
      // *//*initialRoute: '/',
      // routes: {
      //   //'/':(ctx)=> TabsScreen(_favoritedMeals),
      //  // CategoryMealsScreen.routeName: (ctx)=>CategoryMealsScreen(_availableMeals),
      //   //MealDetailScreen.routeName:(ctx)=>MealDetailScreen(_toogleFavorite,_isMealFavorite),
      //   //FilterScreen.routeName:(ctx)=>FilterScreen(_filters,_setFilters),
      // },
      // onGenerateRoute: (settings) {
      //   // print(settings.arguments);
      //   // if(settings.name=='/meal-details'){
      //   //     return;
      //   // }else if(settings.name=='/something-else'){
      //   //   return;
      //   // }else{
      //   //   MaterialPageRoute(builder: (context) => CategoryMealsScreen(),);
      //   // }
      // },*/
      home: ProductsOverviewScreen(),
    );
  }
}


