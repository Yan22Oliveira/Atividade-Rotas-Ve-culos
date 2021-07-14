import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../api/api.dart';
import './helpers/helpers.dart';

import './screens/base_screen/base_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ListaMontadoras(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CadastrarMontadora(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => DeletarMontadora(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => EditarMontadora(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ListaVeiculos(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CadastrarVeiculos(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => EditarVeiculos(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => DeletarVeiculos(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Atividade Rotas - Veículos',
        theme: ThemeData(
          primaryColor: colorPrimary,
        ),
        home: BaseScreen(),
      ),
    );
  }
}

