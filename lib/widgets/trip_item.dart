import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget { 

  final String title;
  final String imageUrl;
  final List<String> duration;
  final TripType tripType;
  final Season season;

  TripItem({
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.tripType,
  });
  
   void selectTrip(){

   }
   
  @override
  Widget build(BuildContext context) {
    return InkWell( 

      onTap:selectTrip,
      child: Card(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),

        ),

        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),

                  ),
                  child: Image.network(
                    imageUrl,
                    height:250,
                    width: double.infinity,
                    fit:BoxFit.cover,
                    ),
                ),
                Container(
                  height:250,
                  alignment: Alignment.bottomRight,
                  padding:EdgeInsets.symmetric(
                    vertical:10,
                    horizontal: 20,
                  ),
                  decoration:BoxDecoration(
                    gradient:LinearGradient(
                    begin:Alignment.topCenter,
                    end:Alignment.bottomCenter,
                    colors:[
                      Colors.black.withAlpha(0),
                      Colors.black.withAlpha(204),
                    ],
                    stops:[0.6, 1],

                    )
                  ),
                  child: Text(
                   title,
                  style: Theme.of(context).textTheme.headlineMedium
                  ?.copyWith(color: Colors.white),
                  overflow: TextOverflow.fade,
                          
                  ),
                ),
              ],
            )
          ],


        ),

      ),



    );
  }
}