import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homwlayout/home layout.dart';
//---------------------------------------------------

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}
