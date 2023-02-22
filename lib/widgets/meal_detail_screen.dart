import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static var routeName= '/meal_detail';
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('$mealId'),),
      body: Center(
        child: Text(
          'The Meal $mealId'
        ),
      ),
    );
  }
}
