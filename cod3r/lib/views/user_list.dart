import 'package:cod3r/data/dummy_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    const users = {...DUMMY_USERS};
    
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => 
          Text(users.values.elementAt(index).name)
      )
    );
  }
}