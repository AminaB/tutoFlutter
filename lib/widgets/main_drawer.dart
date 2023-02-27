import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler){
    return  ListTile(
      leading: Icon(icon,size: 26,),
      title: Text(title, style: TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),),
      onTap: tapHandler,
    );

  }
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text('Cooking Up',style:TextStyle(
              fontWeight: FontWeight.w900  ,
              fontSize: 30
            )),
          ),
          SizedBox(height: 20,),
         buildListTile('Meals', Icons.restaurant,(){
           Navigator.of(context).pushNamed(FilterScreen.routeName);
         }),
         buildListTile('Filters', Icons.settings,(){
           Navigator.of(context).pushNamed('/');
         })

        ],
      )
      ,
    );
  }
}
