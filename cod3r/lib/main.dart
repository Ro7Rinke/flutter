import 'package:flutter/material.dart';

import 'views/user_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'COD3R',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: UserList(),
    );
  }
}
