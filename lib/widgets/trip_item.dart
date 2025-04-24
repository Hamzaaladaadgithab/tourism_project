import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../screens/trip_detail_screen.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget { 
  final String id;
  final String title;
  final String imageUrl;
  final List<String> duration;
  final TripType tripType;
  final Season season;
  final Function removeItem;

  TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.tripType,
    required this.removeItem,
  });

String get seasonText {
  switch (season) {
    case Season.winter:
      return 'KIŞ';
    case Season.spring:
      return 'BAHAR';
    case Season.summer:
      return 'YAZ';
    case Season.autumn:
      return 'SONBAHAR';
    default:
      return 'Bilinmeyen';
  }
}    

String get TripTypeText {
  switch (tripType) {
    case TripType.Exploration:
      return 'Keşifetme';

    case TripType.Recovery:
      return 'İyileşmek'; 

    case TripType.Activities:
      return 'Aktiviteler'; 

    case TripType.Therapy:
      return 'iyileştirme';

    default:
      return 'Bilinmeyen';
  }
} 



  
   void selectTrip(BuildContext context){

     Navigator.of(context).pushNamed(TripDetailScreen.screenRoute,
     arguments:id,
     ).then((result){  
         if(result != null){
          removeItem(result);
         }
     });
   }
   
  @override
  Widget build(BuildContext context) {
    return InkWell( 
      onTap:() => selectTrip(context),
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
            ),
            Padding(  

              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [  
                  Row(
                    children: [
                      Icon(Icons.today, color: Colors.amber),
                      SizedBox(
                        width:6,
                      ),
                      Text('$duration')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny, color: Colors.amber),
                      SizedBox(
                        width:6,
                      ),
                      Text(seasonText)
                    ],
                  ),

                   Row(
                    children: [
                      Icon(
                        Icons.family_restroom, color: Colors.amber),
                      SizedBox(
                        width:6,
                      ),
                      Text(TripTypeText)
                    ],
                  ),
                ],
              ),
            ),
            
          ],
        ),

      ),

    );
  }
}