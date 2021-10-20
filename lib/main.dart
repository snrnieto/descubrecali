import 'dart:ui';

import 'package:descubrecaliapp/Pages/Inicial.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Descubre Cali',
      theme: ThemeData(
        primaryColor: Color(0xFF6A00AF),
        accentColor: Color(0xFFFF8015),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Inicial();
  }
}
