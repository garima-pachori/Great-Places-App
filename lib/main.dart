import 'package:flutter/material.dart';
import 'package:great_places_app/Screens/places_list.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';
import './Screens/add_place.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(secondary: Colors.amber)
        ),
        home: const PlacesList(),
        routes: {
          AddPlacesScreen.routeName:(ctx) => const AddPlacesScreen(),
        },
      ),
    );
  }
}
