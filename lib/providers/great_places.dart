import 'package:flutter/material.dart';
import '../models/place.dart';
import 'dart:io';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _items=[];

  List<Place> get items{
    return [..._items];
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
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title' : newPlace.title,
      'image' : newPlace.image!.path
    });
  }

  Future<void> fetchAndSetPlaces() async{
      final dataList = await DBHelper.getData('places');
      _items=dataList.map(
        (item)=> Place(
          id: item['id'], 
          title: item['title'],
          image: File(item['image']),
          location: null
        )
      ).toList();
      notifyListeners();
  }
}