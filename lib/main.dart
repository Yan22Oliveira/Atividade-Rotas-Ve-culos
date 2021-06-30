import 'package:flutter/material.dart';

import './helpers/helpers.dart';

import './screens/base_screen/base_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade Rotas - Veículos',
      theme: ThemeData(
        primaryColor: colorPrimary,
      ),
      home: BaseScreen(),
    );
  }
}

