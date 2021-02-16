import 'package:cod3r/data/dummy_users.dart';
import 'package:cod3r/models/user.dart';
import 'package:flutter/cupertino.dart';

class UsersProvider with ChangeNotifier{
  
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int index){
    return _items.values.elementAt(index);
  }

  void put(User user){
    if(user == null)
      return;
    
    if(user.id != null 
      && user.id.trim().isNotEmpty 
      && _items.containsKey(user.id))
      _items.update(user.id, (_) => User(
        id: user.id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl
      ));
    else{
      final id = new DateTime.now().toString();

      _items.putIfAbsent(id, () => User(
        id: id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl
      ));
    }
    

    notifyListeners();
  }

  void remove(String id) {
    if(id == null && id.trim().isEmpty)
      return;

    _items.remove(id);

    notifyListeners();
  }

}