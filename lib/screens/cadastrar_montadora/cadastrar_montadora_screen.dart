import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

import '../../common/common.dart';
import '../../helpers/helpers.dart';
import '../../models/models.dart';

class CadastrartMontadoraScreen extends StatefulWidget {

  @override
  _CadastrartMontadoraScreenState createState() => _CadastrartMontadoraScreenState();
}

class _CadastrartMontadoraScreenState extends State<CadastrartMontadoraScreen> {

  final referenceDatabase = FirebaseDatabase.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _imagenController = TextEditingController();

  void limparCampos(){
    _nomeController.clear();
    _imagenController.clear();
  }

  @override
  Widget build(BuildContext context) {

    final ref  = referenceDatabase.reference();

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Cadastrar Montadora"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{

          if(formKey.currentState!.validate()){

            try{

              final result = await ref.child("montadoras").push().set(
                Montadora(
                  imagem: _imagenController.text,
                  nome: _nomeController.text,
                ).toJson()
              );

              limparCampos();

            }catch(erro){
              print(erro);
            }

          }

        },
        backgroundColor: colorPrimary,
        tooltip: 'Cadastrar Montadora',
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 36,),

               TextFormField(
                 controller: _nomeController,
                 keyboardType: TextInputType.text,
                 validator: (text){
                   if(text!.trim().isEmpty)
                     return 'Campo obrigatório';
                   return null;
                 },
                 style: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.w300,
                 ),
                 decoration: InputDecoration(
                   isDense: true,
                   counterText: '',
                   border: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.grey,
                       width: 0.5,
                     ),
                   ),
                   labelText: "Nome da montadora",
                   labelStyle: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w300,
                   ),
                 ),
               ),
                const SizedBox(height: 24,),
                TextFormField(
                  controller: _imagenController,
                  keyboardType: TextInputType.text,
                  validator: (text){
                    if(text!.trim().isEmpty)
                      return 'Campo obrigatório';
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    counterText: '',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                    labelText: "Logo da montadora",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );

  }
}
