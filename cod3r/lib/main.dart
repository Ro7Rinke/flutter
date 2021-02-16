import 'package:cod3r/provider/users.dart';
import 'package:cod3r/routes/app_routes.dart';
import 'package:cod3r/views/user_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/user_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build (BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'COD3R',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}
