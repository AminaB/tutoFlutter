import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('The recipes'),
        ),
          body: Center(
              child: Text('The Recipes For The Category')
          )
      ),
    );
  }
}
