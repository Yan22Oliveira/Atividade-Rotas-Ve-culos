import 'package:flutter/material.dart';

import './screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade Rotas - Veículos',
      theme: ThemeData(
        primaryColor: Color(0xFFe63946),
      ),
      home: HomeScreen(),
    );
  }
}

