import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

import '../../common/common.dart';
import '../../mockdata/mockdata.dart';
import '../../models/models.dart';

import '../veiculos/veiculos_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Montadora> listMontadoras = [];

  late DatabaseReference montadoraReference;

  @override
  void initState() {
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase();
    montadoraReference.onChildAdded.listen((event) { });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        title: Text("Montadoras"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: ListView.builder(
          itemCount: listaMontadoras.length,
          itemBuilder: (context,index){
            return GestureDetector(

              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VeiculosScreen(montadora: listaMontadoras[index],),
                  ),
                );
              },

              child: Card(
               elevation: 3,
               color: Colors.white,
               clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Container(
                  height: 80,
                  child: Row(
                    children: [
                      const SizedBox(width: 16,),
                      Image.network(
                        listaMontadoras[index].imagem,
                        fit: BoxFit.cover,
                        height: 60,
                      ),
                      const SizedBox(width: 16,),
                      Expanded(
                        child: Text(
                          listaMontadoras[index].nome,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            letterSpacing: 2,

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

  }
}
