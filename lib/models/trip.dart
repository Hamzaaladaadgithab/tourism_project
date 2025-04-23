import 'package:flutter/material.dart';


enum Season {
  winter,
  spring,
  summer,
  autumn,
}

enum TripType{
  Exploration,
  Recovery,
  Activities,
  Therapy,

}
class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> activities;
  final List<String> program;
  final List<String> duration;
  final Season season;
  final TripType  tripType;
  final bool isINsummer;
  final bool isInwinter;
  final bool isforfamilies;


  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.activities,
    required this.program,
    required this.duration,
    required this.season,
    required this.tripType,
    required this.isINsummer,
    required this.isInwinter,
    required this.isforfamilies,
  });
}