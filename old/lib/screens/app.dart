import 'package:app/screens/location_detail.dart';
import 'package:flutter/material.dart';
import 'location_detail.dart';
import '../style.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LocationDetail(),
        theme: ThemeData(
            appBarTheme:
                AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle))));
  }
}
