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
   List<Trip>_favoriteTrips = [];

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
   
  void _mangeFavorite(String tripId){

     final existingIndex = _favoriteTrips.indexWhere((trip) => trip.id == tripId);

     if(existingIndex >= 0 ){

      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
     } else{
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId),
        );
      });
     }
  }

  bool _isFovarite(String id){
      return _favoriteTrips.any((trip) => trip.id ==id);
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
        '/': (context) => TabsScreen(_favoriteTrips), // ana sayfa denir
        CategoryTripsScreen.routeName: (context) => CategoryTripsScreen(
          _availableTrips ),
        TripDetailScreen.screenRoute: (context) => TripDetailScreen(_mangeFavorite, _isFovarite),
        FiltersScreen.screenRoute: (context) => FiltersScreen(_filters ,
        _changeFilters),
      },
    );
  }
}
