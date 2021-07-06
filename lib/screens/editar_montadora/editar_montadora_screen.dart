import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../api/api.dart';
import '../../helpers/helpers.dart';
import '../../models/models.dart';

class EditarMontadoraScreen extends StatefulWidget {

  final Montadora montadora;
  EditarMontadoraScreen({required this.montadora});

  @override
  _EditarMontadoraScreenState createState() => _EditarMontadoraScreenState();
}

class _EditarMontadoraScreenState extends State<EditarMontadoraScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Montadora montadora = Montadora.create();

  @override
  Widget build(BuildContext context) {

    return Consumer2<EditarMontadora,ListaMontadoras>(

      builder: (_,editarMontadora,listaMontadoras,__){

        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text("Editar "+widget.montadora.nome),
            centerTitle: true,
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: editarMontadora.loading?null:()async{

              if(formKey.currentState!.validate()){

                await editarMontadora.patchEditarMontadora(

                    montadora: Montadora(
                      id: widget.montadora.id,
                      nome: montadora.nome.isNotEmpty?montadora.nome:widget.montadora.nome,
                      imagem: montadora.imagem.isNotEmpty?montadora.imagem:widget.montadora.imagem,
                    ),

                    onSuccess: (text)async{

                      listaMontadoras.getListaMontadoras();

                      scaffoldKey.currentState!.showSnackBar(
                          SnackBar(
                            content: Text(
                              text,
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          )
                      );

                      Future.delayed(Duration(seconds: 2)).then((_){
                        Navigator.pop(context);
                      });

                    },
                    onFail: (text){

                    }
                );

              }

            },
            tooltip: 'Editar Montadora',
            backgroundColor: editarMontadora.loading?Colors.grey:colorPrimary,
            elevation: editarMontadora.loading?0:3,
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(editarMontadora.loading)
                    LinearProgressIndicator(
                      color: Colors.blueAccent,
                      backgroundColor: Colors.white,
                      minHeight: 5,
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 36,),
                        TextFormField(
                          initialValue: widget.montadora.nome,
                          keyboardType: TextInputType.text,
                          validator: (text){
                            if(text!.trim().isEmpty)
                              return 'Campo obrigatório';
                            return null;
                          },
                          onChanged: (text){
                            montadora.nome = text;
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
                          initialValue: widget.montadora.imagem,
                          keyboardType: TextInputType.text,
                          validator: (text){
                            if(text!.trim().isEmpty)
                              return 'Campo obrigatório';
                            return null;
                          },
                          onChanged: (text){
                            montadora.imagem = text;
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
                ],
              ),
            ),
          ),

        );

      },

    );

  }
}
