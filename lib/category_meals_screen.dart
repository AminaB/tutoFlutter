import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static var routeName= '/category_meals';

  // final String categoryId;
  // final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];
    final categoryMeals=DUMMY_MEALS.where((element) => element.categories.contains(categoryId)).toList();
    return  Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.toString()),
        ),
          body: ListView.builder(itemBuilder: (ctx, index) =>
              Text(categoryMeals[index].title),
              itemCount: categoryMeals.length,
          ),

          )
    );
  }
}
