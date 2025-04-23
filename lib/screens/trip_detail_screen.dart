import 'package:flutter/material.dart';
import 'package:tourism/app_data.dart';


class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';
  
  Widget buidlSectionTitle( titleText){
    return Container(
            margin:EdgeInsets.symmetric(horizontal: 10, vertical:10),
            alignment: Alignment.topLeft,
            child:Text(
                  titleText,
                  style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                 fontWeight: FontWeight.bold,
                 ),
              ),
          );
  }    

  Widget buildListViewContainer(Widget child){
    return  Container(
            decoration: BoxDecoration(
              color:Colors.white,
              border: Border.all(color:Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            height:200,
            margin: EdgeInsets.symmetric(horizontal:5),
            child: child,
            );
  }

  @override
  Widget build(BuildContext context) {

    final tripId = ModalRoute.of(context)?.settings.arguments as String;

    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),

      body:SingleChildScrollView(
          child:Column(
        children:[
          Container(
            height:300,
            width: double.infinity,
            child: Image.network(selectedTrip.imageUrl,
            fit:BoxFit.cover,
            ),
          ),
       
          // bu method aktivite  tasarımım olustırma 
          buidlSectionTitle('Aktiviteler:'),
           // bu method gunluk programi  tasarımım olustırma 
          buildListViewContainer(
              ListView.builder(
              itemCount:selectedTrip.activities.length,
              itemBuilder:(context,index) => Card(
                child:Padding(
                  padding: const EdgeInsets.symmetric(
                   vertical:5,
                   horizontal:10
                   ),

                child:Text(selectedTrip.activities[index]),
              ),
              ),
            ),
          ),
          // burada methodlar çağırma 
          buidlSectionTitle('Günlük Program:'),
          buildListViewContainer(
            ListView.builder(
              itemCount: selectedTrip.program.length,
              itemBuilder:(context,index) => Column(
                children: [
              ListTile(
                leading: CircleAvatar(
                  child:Text('Gün${index+1}'),
                ),
                title:Text(selectedTrip.program[index]),
              ),
              Divider(),
              ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
    
  }
}