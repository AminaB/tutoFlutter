
import 'package:flutter/material.dart';
import 'package:tuto_flutter/providers/cart.dart';
import 'package:tuto_flutter/providers/orders.dart';
import 'package:tuto_flutter/providers/products.dart';
import 'package:tuto_flutter/screens/cart_screen.dart';
import 'package:tuto_flutter/screens/edit_product_screen.dart';
import 'package:tuto_flutter/screens/orders_screen.dart';
import 'package:tuto_flutter/screens/product_detail_screen.dart';
import 'package:tuto_flutter/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:tuto_flutter/screens/user_product_screen.dart';


void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext ctx) =>Products(),),
        ChangeNotifierProvider(create: (BuildContext ctx) =>Cart(),),
        ChangeNotifierProvider(create: (BuildContext ctx) =>Orders(),),


      ],
      child: MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.orange),
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
        routes: {
          ProductDetailScreen.routeName:(ctx)=>ProductDetailScreen(),
          CartScreen.routeName:(ctx)=>const CartScreen(),
          OrderScreen.routeName:(ctx)=>const OrderScreen(),
          UserProductsScreen.routeName:(ctx)=>UserProductsScreen(),
          EditProductsScreen.routeName:(ctx)=>EditProductsScreen(),
        },
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
      ),
    );
  }
}


