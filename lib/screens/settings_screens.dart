import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:receitas/components/main_drawer.dart';
import 'package:receitas/models/settings.dart';

class SettingsScreens extends StatefulWidget {

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreens(this.settings,this.onSettingsChanged);

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {

  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
    ) {
      return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
            onChanged(value);
            widget.onSettingsChanged(settings);
        }
        );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Configurações')),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutén', 
                  'Só exibe refeições sem glúten',
                  settings.isGlutenFree,
                  (value) => setState((() => settings.isGlutenFree = value))
                  ),
                  _createSwitch(
                  'Sem Lactose', 
                  'Só exibe refeições sem lactose',
                  settings.isLactoseFree,
                  (value) => setState((() => settings.isLactoseFree = value))
                  ),
                  _createSwitch(
                  'Vegana', 
                  'Só exibe refeições vegana',
                  settings.isVegan,
                  (value) => setState((() => settings.isVegan = value))
                  ),
                   _createSwitch(
                  'Vegetariano', 
                  'Só exibe refeições vegetariana',
                  settings.isVegetarian,
                  (value) => setState((() => settings.isVegetarian = value))
                  ),
              ],
            ),
            ),
        ]
      ),
    );
  }
}