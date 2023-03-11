import 'package:flutter/material.dart';
import 'package:great_places_app/Screens/add_place.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import 'package:provider/provider.dart';


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
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: ChangeNotifierProvider.value(
        value: Provider.of<GreatPlaces>(context),
        child: Consumer<GreatPlaces>(
          child: const Center(
            child: Text('Got no places yet, start adding some!'),
          ),
          builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty ? ch ?? const Text('Got no places yet, start adding some!')
              : ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: 
                          greatPlaces.items[i].image != null
                        ? FileImage(greatPlaces.items[i].image!)
                        : null,
                    ),
                    title: Text(greatPlaces.items[i].title),
                    onTap: (){
                      
                    },
                  ),
                ),
        ),
      ),
    );
  }
}