import 'package:flutter/material.dart';
import 'package:project4/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // initialRoute: '/',
      // routes: {
      //   '/':(context) =>  const Homepage(),
      //   '/second':(context) =>const Example()
      // },
    
      home:   Homepage(),
    );
  }
}

