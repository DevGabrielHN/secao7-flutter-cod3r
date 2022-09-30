import 'package:flutter/material.dart';
import 'package:receitas/screens/categories_meals_screens.dart';
import 'package:receitas/screens/categories_screens.dart';
import 'package:receitas/utils/app_routes.dart';

import 'screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ThemeData tema = ThemeData(fontFamily: 'Raleway',canvasColor: Color.fromRGBO(255, 254, 229, 1) );

    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            ),
          ),
      ),
      routes:{
        AppRoutes.HOME: (_) => CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (_) => MealDetailScreen(),
      },
      // onGenerateRoute: ((settings) {
      //   if(settings.name == '/alguma-coisa'){
      //     return null;
      //   }
      //   else if(settings.name == 'outra-coisa'){
      //     return null;
      //   }else {
      //     return MaterialPageRoute(
      //       builder: (_) {
      //         return CategoriesScreen();
      //       }
      //       );
      //   }
      // }
      // ),
      onUnknownRoute: ((settings) {
        return  MaterialPageRoute(
          builder: (_) {
            return CategoriesScreen();
        });
      }),
    );
  }
} 