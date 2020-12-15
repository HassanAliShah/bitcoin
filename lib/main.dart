import 'package:bitcoin/login_Page.dart';
import 'package:bitcoin/main_Page.dart';
import 'package:bitcoin/register_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: main_Page.id,
      routes: {
        register_Screen.id: (context) => register_Screen(),
        main_Page.id: (context) => main_Page(),
        login_Page.id: (context) => login_Page()
      },
    );
  }
}
