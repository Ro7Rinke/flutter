import 'package:cod3r/components/user_tile.dart';
import 'package:cod3r/models/user.dart';
import 'package:cod3r/provider/users.dart';
import 'package:cod3r/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    final UsersProvider users = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () {
              Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM
                );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, index) => 
          UserTile(users.all.elementAt(index))
      )
    );
  }
}