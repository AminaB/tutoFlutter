import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;


  CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
          body: Center(
              child: Text('The Recipes For The Category')
          )
      ),
    );
  }
}
