import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:receitas/components/meal_item.dart';
import 'package:receitas/data/dummy_data.dart';
import 'package:receitas/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  final category = ModalRoute.of(context)?.settings.arguments as Category;

  final categoryMeals = DUMMY_MEALS.where((meals) {
    return meals.categories.contains(category.id);
  }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: ((ctx, index) {
          return MealItem(categoryMeals[index]);
        }),
      ));
  }
}