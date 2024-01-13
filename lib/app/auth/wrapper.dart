import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_template/app/auth/login_screen.dart';
import 'package:my_template/app/screens/tab_screen.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Box<UserModel>? storeData;

  @override
  void initState() {
    super.initState();
    storeData = Hive.box<UserModel>(userModel);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: storeData!.listenable(),
      builder: (context, Box<UserModel> userData, _) {
        if (userData.get(tokenKey) == null) {
          return const LoginScreen();
        } else {
          return const TabScreen();
        }
      },
    );
  }
}
