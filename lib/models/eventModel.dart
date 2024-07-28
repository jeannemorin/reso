import 'package:flutter/material.dart';

class Event {
  final String coverImageUrl;
  final String title;
  final String location;
  final DateTime dateTime;
  final String status; // "price", "free", "sold out"
  //final List<String>
  //participants; // URLs or image assets for participant thumbnails

  Event({
    required this.coverImageUrl,
    required this.title,
    required this.location,
    required this.dateTime,
    required this.status,
    //required this.participants,
  });
}

enum Status {
  price,
  free,
  sold_out,
}
