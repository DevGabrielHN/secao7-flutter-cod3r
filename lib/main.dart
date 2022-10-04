import 'package:flutter/material.dart';
import 'package:receitas/data/dummy_data.dart';
import 'package:receitas/models/meal.dart';
import 'package:receitas/models/settings.dart';
import 'package:receitas/screens/categories_meals_screens.dart';
import 'package:receitas/screens/categories_screens.dart';
import 'package:receitas/screens/tabs_screen.dart';
import 'package:receitas/utils/app_routes.dart';

import 'screens/meal_detail_screen.dart';
import 'screens/settings_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings){
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }


  void _toggleFavorite(Meal meal){

    setState(() {
      _favoriteMeals.contains(meal) 
      ? _favoriteMeals.remove(meal)
      : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }

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
        AppRoutes.HOME: (_) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (_) => MealDetailScreen(_toggleFavorite,_isFavorite),
        AppRoutes.SETTINGS: (_) => SettingsScreens(settings,_filterMeals),
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