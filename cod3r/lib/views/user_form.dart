import 'package:cod3r/models/user.dart';
import 'package:cod3r/provider/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget{
  
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  
  void _loadFormData(User user){
    if(user != null){
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Form'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save), 
            onPressed: () {

              if(_form.currentState.validate()){
                
                _form.currentState.save();
                
                Provider.of<UsersProvider>(context, listen: false).put(
                  User(
                    id: _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    avatarUrl: _formData['avatarUrl']
                  )
                );

                Navigator.of(context).pop();
              }
            }
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                initialValue: _formData['name'],
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'Name can\'t be empty';
                  
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                initialValue: _formData['email'],
                validator: (value) {
                  if(value == null || value.isEmpty)
                    return 'Email can\'t be empty';
                  else if(!value.contains('@') || !value.contains('.'))
                    return 'Invalid email address';

                  return null;
                },
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Avatar URL'),
                initialValue: _formData['avatarUrl'],
                onSaved: (value) => 
                  _formData['avatarUrl'] = value == null ? '' : value,
              ),
            ],
          )
        ),
      ),
    );
  } 
}