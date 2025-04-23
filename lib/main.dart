import 'package:flutter/material.dart';
import 'package:tourism/screens/categories_screen.dart';
import 'package:tourism/screens/category_trips_screen.dart';
import 'package:tourism/screens/trip_detail_screen.dart';
import './screens/category_trips_screen.dart';
import './screens/trip_detail_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Tourism App',
      theme:ThemeData(
        primarySwatch: Colors.blue,

      ),

      //home:CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => CategoriesScreen(),
        CategoryTripsScreen.routeName: (context) => CategoryTripsScreen(),
        TripDetailScreen.screenRoute:(context) => TripDetailScreen(),
            },
    );
  }
}

