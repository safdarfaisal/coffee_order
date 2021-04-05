import 'package:flutter/material.dart';
import 'coffeeorder.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFA84030),
      ),
      home: CoffeeOrder(),
    );
  }
}


