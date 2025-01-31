import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../api/api.dart';
import '../../helpers/helpers.dart';
import '../../models/models.dart';

class CadastrartMontadoraScreen extends StatefulWidget {

  @override
  _CadastrartMontadoraScreenState createState() => _CadastrartMontadoraScreenState();
}

class _CadastrartMontadoraScreenState extends State<CadastrartMontadoraScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _nomeController = TextEditingController();
  final _imagenController = TextEditingController();

  void limparCampos(){
    _nomeController.clear();
    _imagenController.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer2<CadastrarMontadora,ListaMontadoras>(

      builder: (_,cadastrarMontadora,listaMontadoras,__){

        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text("Cadastrar Montadora"),
            centerTitle: true,
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: cadastrarMontadora.loading?null:()async{

              if(formKey.currentState!.validate()){

                await cadastrarMontadora.postCadastrarMontadora(
                    montadora: Montadora(
                        nome: _nomeController.text,
                        imagem: _imagenController.text,
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
                  onFail: (text){}
                );

              }

            },
            tooltip: 'Cadastrar Montadora',
            backgroundColor: cadastrarMontadora.loading?Colors.grey:colorPrimary,
            elevation: cadastrarMontadora.loading?0:3,
            child: Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(cadastrarMontadora.loading)
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
                ],
              ),
            ),
          ),

        );

      },

    );

  }
}
