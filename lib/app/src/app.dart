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
  final FirebaseMessaging? _firebaseMessaging = FirebaseMessaging.instance;

  Box<UserModel>? storeData;

  @override
  void initState() {
    super.initState();
    storeData = Hive.box<UserModel>(userModel);

    var messaging = FirebaseMessaging.instance;

    messaging.getToken().then((value) {
      // logger.i(value);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // logger.i("onMessage: ${message.data}");
      if (notification != null && android != null) {
        logger.i('Message Title: ${notification.title}');
        logger.i('Message Body: ${notification.body}');
        // ... and so on, for other properties of the notification
      }
      // Handle the foreground notification
      // navigateTo(context, destination: NotificationScreen());
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      logger.i('A new onMessageOpenedApp event was published: $message');
      // Handle the notification caused by tapping on it in the system tray
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // logger.i("onMessage: ${message.data}");
      if (notification != null && android != null) {
        logger.i('Message Title: ${notification.title}');
        logger.i('Message Body: ${notification.body}');
        // ... and so on, for other properties of the notification
      }
      // navigateTo(context, destination: NotificationScreen());
    });

    messaging
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        logger.i('A new getInitialMessage event was published: $message');
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;

        // logger.i("onMessage: ${message.data}");
        if (notification != null && android != null) {
          logger.i('Message Title: ${notification.title}');
          logger.i('Message Body: ${notification.body}');
          // ... and so on, for other properties of the notification
        }
        // navigateTo(context, destination: NotificationScreen());
        // Handle the notification caused by tapping on it in the system tray,
        // which launched the application.
      }
    });

  }
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
          title: 'Liteteller Pay',
          home: const SplashScreen(),
        );
      },
    );
  }
}