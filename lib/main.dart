import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:advancedprovider/screens/bottomnavigation.dart';
import 'package:advancedprovider/screens/movielist.dart';
import 'package:advancedprovider/screens/favoritelist.dart';

import 'movieprovider.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Provider Usage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => MovieProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => BottomNavigationProvider()),
        ],
        child: BottomNavigation(),
      ),
    );
  }
}

