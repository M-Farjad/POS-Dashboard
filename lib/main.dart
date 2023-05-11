import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import './bindings/initial_bindings.dart';
import './routes/routes.dart';
import './configs/themes/app_dark_theme.dart';
import './configs/themes/app_light_theme.dart';
import 'screens/profile_screen/components/text_field_model.dart';
// import './dbHelper/mongo_db.dart';

void main() async {
  // await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  // Get x Controller initialization

  InitialBindings().dependencies();

  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox<TextFieldModel>('textFieldsBox');
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme().buildLigtTheme(),
      darkTheme: DarkTheme().buildDarkTheme(),
      getPages: AppRoutes.routes(),
    );
  }
}
