import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title:Text('TURİSTİK REHBERİ'),
    ),
    body:GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent:200,
        childAspectRatio:7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children:[],
      ),
    );
  }
}