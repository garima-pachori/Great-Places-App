import 'package:flutter/material.dart';
import '../models/place.dart';
import 'dart:io';

class GreatPlaces with ChangeNotifier{
  List<Place> _items=[];

  List<Place> get items{
    return [...items];
  }

  get length => null;

  void addPlace(String title, File pickedImage,){
    final newPlace=Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: title,
      location: null
    );
    _items.add(newPlace);
    notifyListeners();
  }
}