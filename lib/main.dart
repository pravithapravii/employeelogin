import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/splash.dart';
// import 'package:sample5/screens/splash.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login sample',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScreenSplash(),
    );
  }
}
