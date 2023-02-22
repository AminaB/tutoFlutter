import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/dummy_data.dart';
import 'package:tuto_flutter/widgets/meal_item.dart';

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
              MealItem(
                  categoryMeals[index].title,
                  categoryMeals[index].affordability,
                  categoryMeals[index].complexity,
                  categoryMeals[index].imageUrl,
                  categoryMeals[index].duration,
                  categoryMeals[index].id
              ),
              itemCount: categoryMeals.length,
          ),

          )
    );
  }
}
