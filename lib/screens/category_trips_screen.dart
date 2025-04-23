import 'package:flutter/material.dart';
import 'package:tourism/models/trip.dart';
import '../widgets/trip_item.dart';
import '../app_data.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const routeName = '/category-trips';

  
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'] ?? 'Kategori Gezileri';
    final categoryId = routeArgs['id'];

    final filteredTrips = Trips_data.where((trip){

      return trip.categories.contains(categoryId);
    
  }).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return  TripItem(
            id:filteredTrips[index].id,
            title:filteredTrips[index].title, 
            imageUrl:filteredTrips[index].imageUrl,
            duration:filteredTrips[index].duration,
            season:filteredTrips[index].season, 
            tripType:filteredTrips[index].tripType,
            );
        },
        itemCount: filteredTrips.length,
      ),
    );
  }
} 