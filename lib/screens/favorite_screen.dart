import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:receitas/components/meal_item.dart';
import 'package:receitas/models/meal.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx,index) {
          return MealItem(favoriteMeals[index]);  
        },);
    }




  }
}