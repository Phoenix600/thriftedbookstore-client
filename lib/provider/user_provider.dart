import 'package:flutter/material.dart';
import 'package:thriftedbookstore/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    cart: [],
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}

// class UserNotifier extends StateNotifier<User> {
//   UserNotifier(super.state);

//   User get user => state;

//   void setUser(String user) {
//     state = User.fromJson(user);
//   }
// }

// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(User(
//       id: "",
//       name: "",
//       email: "",
//       password: "",
//       address: "",
//       type: "",
//       token: "",
//       cart: [])),
// );
