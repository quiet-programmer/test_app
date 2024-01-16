import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:my_template/app/src/app.dart';
import 'package:my_template/const_value.dart';
import 'package:my_template/models/favourite_manager.dart';
import 'package:my_template/models/product_model.dart';
import 'package:my_template/providers/error_dialog_provider.dart';
import 'package:my_template/providers/theme_provider.dart';
import 'package:my_template/providers/user_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Directory document = await getApplicationDocumentsDirectory();
  Hive
    ..init(document.path)
    ..registerAdapter(UserModelAdapter());
  var user = await Hive.openBox<UserModel>(userModel);

  Hive
    ..init(document.path)
    ..registerAdapter(ProductModelAdapter());
  var product = await Hive.openBox<ProductModel>(productModel);

  FavoriteManager.setFavoritesBox(product);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ThemeProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ErrorDialogProvider(),
        ),
      ],
      child: const App(),
    ),
  );
}
