import 'package:flutter/cupertino.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> favoritedMeals;

  FavoritesScreen(this.favoritedMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if(favoritedMeals.isEmpty){
      return Center(child: Text('no favorites'),);

    }
    else{
      return ListView.builder(itemBuilder: (ctx, index) =>
          MealItem(
              favoritedMeals[index].title,
              favoritedMeals[index].affordability,
              favoritedMeals[index].complexity,
              favoritedMeals[index].imageUrl,
              favoritedMeals[index].duration,
              favoritedMeals[index].id,
          ),
        itemCount: favoritedMeals.length,
      );
    }
  }
}
