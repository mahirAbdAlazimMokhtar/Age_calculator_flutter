import 'package:flutter/material.dart';

import 'Screen/home_screen.dart';
void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Age Calculator',
          ),
        ),
        body: SingleChildScrollView(child: HomeScreen()),
      ),
    );
  }
}
