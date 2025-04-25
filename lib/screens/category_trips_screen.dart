import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';


class CategoryTripsScreen extends StatefulWidget {
  static const routeName = '/category-trips';
 
  final List<Trip> availabelTrips; 

  CategoryTripsScreen(this.availabelTrips);

  @override
  _CategoryTripsScreenState createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'] ?? 'Kategori Gezileri';

      displayTrips = widget.availabelTrips.where((trip) {
        return trip.categories.contains(categoryId);
      }).toList();

      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            season: displayTrips[index].season,
            tripType: displayTrips[index].tripType,
           
          );
        },
      ),
    );
  }
}
