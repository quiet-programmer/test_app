import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  // Box<UserModel>? storeData;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   storeData = Hive.box<UserModel>(userModel);
  // }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // return ValueListenableBuilder(
    //   valueListenable: storeData!.listenable(),
    //   builder: (context, Box<UserModel> userData, _) {
    //     if (userData.get(tokenKey) == null) {
    //       return OnBoardingScreen();
    //     } else {
    //       return TabScreen();
    //     }
    //   },
    // );
  }
}
