
import 'package:flutter/material.dart';
import 'package:tuto_flutter/providers/auth.dart';
import 'package:tuto_flutter/providers/cart.dart';
import 'package:tuto_flutter/providers/orders.dart';
import 'package:tuto_flutter/providers/products.dart';
import 'package:tuto_flutter/screens/auth_screen.dart';
import 'package:tuto_flutter/screens/cart_screen.dart';
import 'package:tuto_flutter/screens/edit_product_screen.dart';
import 'package:tuto_flutter/screens/orders_screen.dart';
import 'package:tuto_flutter/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:tuto_flutter/screens/products_overview_screen.dart';
import 'package:tuto_flutter/screens/user_product_screen.dart';


void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Auth(),),
        ChangeNotifierProxyProvider<Auth,Products>(
          update: (ctx, auth, previousProducts) =>Products()
                ..setToken(auth.token.toString())
                ..setItems(previousProducts?.items)
               ,
          create: (ctx) {
            return Products();
          },
        ),
        ChangeNotifierProvider(create: (BuildContext ctx) =>Cart(),),
        ChangeNotifierProvider(create: (BuildContext ctx) =>Orders(),),
      ],
      child: Consumer<Auth>(builder:(ctx, auth, child) =>MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.orange),
          fontFamily: 'OpenSans',
        ),
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
        home: auth.isAuth? ProductsOverviewScreen():AuthScreen(),
      ) ,)
    );
  }
}


