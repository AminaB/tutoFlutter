import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static var routeName= '/category_meals';

  // final String categoryId;
  // final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle=routeArgs['title'];
    //final categoryId=routeArgs['id'];

    return  Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.toString()),
        ),
          body: Center(
              child: Text('The Recipes For The Category')
          )
      ),
    );
  }
}
