import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (ctx) => GreatPlaces(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
      home: PlacesListScreen(),
      debugShowCheckedModeBanner: false,
      routes: {AddPlaceScreen.routeName: (ctx) => AddPlaceScreen()},
    );
  }
}
