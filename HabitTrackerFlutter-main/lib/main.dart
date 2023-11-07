import 'package:flutter/material.dart';
import 'package:habittrackertute/pages/home_page.dart';
import 'package:habittrackertute/pages/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/login_page.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox("Habit_Database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Changed from HomePage() to LoginPage()
      theme: ThemeData(primarySwatch: Colors.lightBlue),
    );
  }
}
