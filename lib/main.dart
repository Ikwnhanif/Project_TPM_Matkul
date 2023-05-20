import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_github/view/menu.dart';

import 'boxes.dart';
import 'models/user_book.dart';

void main() async {
  // Hive.initFlutter();
  await Hive.initFlutter();
  await HiveBox1.initHiveBox1();
  runApp(const MyApp());
}

class HiveBox1 {
  static Future<void> initHiveBox1() async {
    Hive.registerAdapter(LibAdapter());
    await Hive.openBox<Lib>(HiveBoxes.lib);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MyHomePage(
        title: 'Github',
      ),
    );
  }
}
