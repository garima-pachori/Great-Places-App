import 'package:flutter/material.dart';
import 'package:great_places_app/Screens/add_place.dart';


class PlacesList extends StatelessWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
            }, 
            icon: Icon(Icons.add)
          )
        ],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}