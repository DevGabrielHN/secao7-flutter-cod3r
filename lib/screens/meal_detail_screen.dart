import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:receitas/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  final meal = ModalRoute.of(context)!.settings.arguments as Meal;

   return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Ingredientes',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            width: 300,
            height: 250,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (ctx,index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(meal.ingredients[index]),
                  ),
                  color: Theme.of(context).colorScheme.primary,
                );
              }
              ),
          ),
        ],
      ),
    );
  }
}