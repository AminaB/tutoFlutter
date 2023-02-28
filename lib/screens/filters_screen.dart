import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName='/filters';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree=false;
  bool _vegetarian=false;
  bool _vegan=false;
  bool _lactoseFree=false;
  SwitchListTile buildSwitchListTile(String title, String description, bool currentValue, Function (bool) updateValue, ) {
    return SwitchListTile(
        title:Text(title),
        subtitle: Text(description,),
        value: currentValue,
        onChanged: updateValue,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title :Text("your filters ")) ,
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust meal',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten-free',
                    'Only gluten free meals.',
                    _glutenFree,
                    (bool newValue){
                      setState(() {
                        _glutenFree=newValue;
                      });
                    }
                ),
                buildSwitchListTile(
                    'Lactose-free',
                    'Only lactose free meals.',
                    _lactoseFree,
                        (newValue){
                      setState(() {
                        _lactoseFree=newValue;
                      });
                    }
                ),
                buildSwitchListTile(
                    'Vegetarian',
                    'Only vegetarian  meals.',
                    _vegetarian,
                        (newValue){
                      setState(() {
                        _vegetarian=newValue;
                      });
                    }
                ),
                buildSwitchListTile(
                    'Vegan',
                    'Only vegan meals.',
                    _vegan,
                        (newValue){
                      setState(() {
                        _vegan=newValue;
                      });
                    }
                )
              ],
            ),

          )
        ],
      ),
    ) ;
  }


}
