
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      /*  canvasColor: Color.fromRGBO(255, 254, 229, 1),
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
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),*/

      ),
      /*initialRoute: '/',
      routes: {
        //'/':(ctx)=> TabsScreen(_favoritedMeals),
       // CategoryMealsScreen.routeName: (ctx)=>CategoryMealsScreen(_availableMeals),
        //MealDetailScreen.routeName:(ctx)=>MealDetailScreen(_toogleFavorite,_isMealFavorite),
        //FilterScreen.routeName:(ctx)=>FilterScreen(_filters,_setFilters),
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
      },*/
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
        appBar: AppBar(
            title:Text('MyShop')
        ),
     body: Center(
       child: Text('buil a shop'),
     ),
   );
  }
}
