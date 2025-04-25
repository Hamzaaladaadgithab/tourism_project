import 'package:flutter/material.dart';
import './app_data.dart';
import 'package:tourism/models/trip.dart';
import 'package:tourism/screens/categories_screen.dart';
import 'package:tourism/screens/category_trips_screen.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import '../models/trip.dart';
import 'package:tourism/screens/trip_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String , bool >_filters={
    'summer':false,
    'winter':false,
    'family':false,
  };

  List<Trip>_availableTrips = Trips_data;

  void _changeFilters(Map<String , bool> filterData){
    setState(() {
      _filters=filterData;

      _availableTrips = Trips_data.where((trip){
          if(_filters['summer'] == true && trip.isINsummer != true){
               return false;
          } 
          if(_filters['winter'] == true && trip.isInwinter != true){
               return false;
          }  
          if(_filters['family'] == true && trip.isforfamilies != true){
               return false;
          } 
          return true;
      }).toList();
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(), // ana sayfa denir
        CategoryTripsScreen.routeName: (context) => CategoryTripsScreen(
          _availableTrips),
        TripDetailScreen.screenRoute: (context) => TripDetailScreen(),
        FiltersScreen.screenRoute: (context) => FiltersScreen(_filters ,
        _changeFilters),
      },
    );
  }
}
