import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:receitas/components/main_drawer.dart';
import 'package:receitas/models/category.dart';
import 'package:receitas/models/meal.dart';
import 'package:receitas/screens/categories_screens.dart';
import 'package:receitas/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoritesMeals;

  const TabsScreen(this.favoritesMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;
   late List<Map<String,Object>> _screens;

  @override
  void initState(){
    super.initState();
     _screens = [
    {'title': 'Lista de Categorias','screen': CategoriesScreen()}, 
    {'title': 'Meus Favoritos','screen':FavoriteScreen(widget.favoritesMeals)},
  ];
  }


  _selectScreen(int index){
     
    setState(() {
      _selectedScreenIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Center(
         child: Text(
          _screens[_selectedScreenIndex]['title'] as String,
          ),
       ),
     ),
     drawer: MainDrawer(),
     body: _screens[_selectedScreenIndex]['screen'] as Widget,
     bottomNavigationBar: BottomNavigationBar(
      onTap: _selectScreen,
      backgroundColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      currentIndex: _selectedScreenIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
      ],
     ),
    );
  }
}