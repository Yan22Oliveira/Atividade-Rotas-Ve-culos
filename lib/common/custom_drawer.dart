import 'package:flutter/material.dart';

import './drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          ListView(
            children: <Widget>[
              const SizedBox(height: 36,),
              DrawerTile(
                iconData: Icons.home,
                title: 'Início',
                page: 0,
              ),
              DrawerTile(
                iconData: Icons.car_repair,
                title: 'Cadastrar Montadora',
                page: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}