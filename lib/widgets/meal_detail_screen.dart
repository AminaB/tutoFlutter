import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/dummy_data.dart';
import 'package:tuto_flutter/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static var routeName= '/meal_detail';
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context)?.settings.arguments as String;
    final Meal selectMeal=DUMMY_MEALS.firstWhere((element) => element.id==mealId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectMeal.title}'),),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 300,
              width:double.infinity ,
              child: Image.network(selectMeal.imageUrl, fit: BoxFit.cover,),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'inger',
                style:Theme.of(context).textTheme.titleSmall
                ,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemCount: selectMeal.ingredients.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(selectMeal.ingredients[index])
                  ),
                ),
              )

            )],
        ),
      ),
    );
  }
}
