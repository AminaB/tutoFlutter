import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String  imageUrl;
  final int duration;


  MealItem(this.title, this.affordability, this.complexity, this.imageUrl,
      this.duration);
  void selectMeal() {
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl, height: 250,width: double.infinity,fit: BoxFit.cover,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }




}
