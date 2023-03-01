import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/models/meal.dart';
import 'package:tuto_flutter/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static var routeName= '/category_meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
   late String  categoryTitle;
   late List<Meal> displayedMeals;
   var  _loadedInitData=false;

  @override
  void initState() {
    super.initState();
  }
   @override
  void didChangeDependencies() {
    if(!_loadedInitData){
      final routeArgs=ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle=routeArgs['title']!;
      final categoryId=routeArgs['id'];
      displayedMeals=widget.availableMeals.where((element) => element.categories.contains(categoryId)).toList();
      _loadedInitData=true;
    }
    super.didChangeDependencies();

  }
   void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((element) => element.id==mealId);
    });
   }
  @override
  Widget build(BuildContext context) {

    return  Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.toString()),
        ),
          body: ListView.builder(itemBuilder: (ctx, index) =>
              MealItem(
                  displayedMeals[index].title,
                  displayedMeals[index].affordability,
                  displayedMeals[index].complexity,
                  displayedMeals[index].imageUrl,
                  displayedMeals[index].duration,
                  displayedMeals[index].id,
              ),
              itemCount: displayedMeals.length,
          ),

          )
    );
  }
}
