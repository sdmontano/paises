import 'package:flutter/material.dart';
import 'package:paises/screens/detail_screen.dart';
import 'package:paises/screens/home_screen.dart';
import 'package:paises/screens/map.dart';
import 'package:paises/widgets/cards.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'detail': (BuildContext context) => DetailScreen(),
        'map': (BuildContext context) => MapScreen(),
      },
    );
  }
}
