import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName='/filters';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title :Text("your filters ")) ,
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    ) ;
  }
}
