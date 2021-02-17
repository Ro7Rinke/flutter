import 'package:cod3r/models/user.dart';
import 'package:cod3r/provider/users.dart';
import 'package:cod3r/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget{
  
  final User user;

  const UserTile(this.user);

  void _deleteUser(BuildContext context, String id){

    Provider.of<UsersProvider>(context, listen: false).remove(user.id);
  }

  void _dialogDeleteUser(BuildContext context, User user){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete user'),
        content: Text('You really want to delete ' + user.name),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () =>
              Navigator.of(context).pop(true)
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () =>
              Navigator.of(context).pop(false)
          )
        ],
      )
    ).then((confirmed) {
      if(confirmed)
        _deleteUser(context, user.id);
    });
  }
  
  @override
  Widget build(BuildContext context){
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
      ? CircleAvatar(child: Icon(Icons.person),)
      : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl),);
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit), 
              color: Colors.orange, 
              onPressed: (){
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user
                );
              }
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red, 
              onPressed: (){
                _dialogDeleteUser(context, user);
              }
            ),
          ],
        ),
      )
    );
  }
}