import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'screens/profile_screen/profile_screen.dart';
import 'constants/constants.dart';

late Size mq;

void main() async {
  //init Flutter
  await Hive.initFlutter();
  //open Box
  var box = await Hive.openBox('MyBox');
  runApp(const MyApp());
}

//For comment removing
// \/\/.*$|\/\*[\s\S]*?\*\/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: bodyColor),
        canvasColor: secondaryColor,
      ),
      home: const ProfileScreen(),
    );
  }
}
