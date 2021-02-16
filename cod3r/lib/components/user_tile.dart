import 'package:cod3r/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget{
  
  final User user;

  const UserTile(this.user);
  
  @override
  Widget build(BuildContext context){
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
      ? CircleAvatar(child: Icon(Icons.person),)
      : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl),);
    return ListTile(
      leading: avatar,
      
    );
  }
}