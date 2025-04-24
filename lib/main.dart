import 'package:flutter/material.dart';
import 'package:tourism/screens/categories_screen.dart';
import 'package:tourism/screens/category_trips_screen.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
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
        primarySwatch: Colors.amber,

      ),

      //home:CategoriesScreen(),
      initialRoute: '/',
      routes: {
        // bu artık ana sayfamız yani app ilk çalıştığında bunu çıkıyor 
        '/': (context) => TabsScreen(), // Anasayfa (HomePage) 
        CategoryTripsScreen.routeName: (context) => CategoryTripsScreen(),
        TripDetailScreen.screenRoute:(context) => TripDetailScreen(),
        FiltersScreen.screenRoute:(context) => FiltersScreen(),
            },
    );
  }
}

