import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:my_template/app/src/spalsh_screen.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/custom_theme.dart';
import 'package:my_template/models/user_model.dart';
import 'package:my_template/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    final checkTheme = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:
          checkTheme.mTheme == false ? buildLightTheme() : buildDarkTheme(),
          title: 'Test App',
          home: const SplashScreen(),
        );
      },
    );
  }
}