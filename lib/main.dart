import 'package:flutter/material.dart';

import 'package:flutter_task1/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.orange,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
        )
      ),
      home: const HomeScreen(),
    );
  }
}
