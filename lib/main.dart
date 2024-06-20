import 'package:flutter/material.dart';
import 'Screens/editPage.dart';
import 'Screens/fillDetails.dart';
import 'Screens/homepage.dart';
import 'Screens/showData.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => Homepage(),
        '/fillDetails' : (context) => Filldetails(),
        '/editPage' : (context) => EditPage(),
        '/showData' : (context) => showData(),
      },
    );
  }
}
