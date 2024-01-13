// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:my_template/const_value.dart';
// import '../models/user_model.dart';
//
// class UserProvider with ChangeNotifier {
//   late Box<UserModel?> _userBox;
//
//   UserProvider(Box<UserModel?> userBox) {
//     _userBox = userBox;
//   }
//
//   UserModel? _currentUser;
//
//   UserModel? get currentUser => _currentUser;
//
//   // Check if a user is authenticated
//   bool get isAuthenticated => _currentUser != null;
//
//   // Perform login
//   Future<void> login(String? email, String? password) async {
//     _currentUser = _userBox.values.firstWhere(
//           (user) => user?.email == email && user?.password == password,
//       orElse: () => UserModel(),
//     );
//
//     if (_currentUser != null) {
//       notifyListeners();
//     } else {
//       throw Exception("Invalid credentials"); // or handle the failed login scenario accordingly
//     }
//   }
//
//
//   // Perform logout
//   void logout() {
//     _currentUser = null;
//     notifyListeners();
//   }
// }
