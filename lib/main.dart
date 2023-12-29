import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_template/app/src/app.dart';
import 'package:my_template/providers/error_dialog_provider.dart';
import 'package:my_template/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Directory document = await getApplicationDocumentsDirectory();
  // Hive
  //   ..init(document.path)
  //   ..registerAdapter(UserModelAdapter());
  // final stateOfApp = await Hive.openBox<UserModel>(userModel);

  // if (stateOfApp.get(balanceKey) == null) {
  //   await stateOfApp.put(balanceKey, UserModel());
  // }
  //
  // if (stateOfApp.get(firstLoginKey) == null) {
  //   await stateOfApp.put(firstLoginKey, UserModel());
  // }
  //
  // if (stateOfApp.get(allowNotificationKey) == null) {
  //   await stateOfApp.put(allowNotificationKey, UserModel());
  // }
  //
  // if (stateOfApp.get(bioAuthKey) == null) {
  //   await stateOfApp.put(bioAuthKey, UserModel());
  // }
  //
  // if (stateOfApp.get(userAuthKey) == null) {
  //   await stateOfApp.put(userAuthKey, UserModel());
  // }

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
