import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../api/api.dart';
import '../../helpers/helpers.dart';
import '../../models/models.dart';

import '../cadastrar_veiculos/cadstrar_veiculos_screen.dart';
import '../editar_veiculo/editar_veiculo_screen.dart';

class VeiculosScreen extends StatefulWidget {

  final Montadora montadora;
  VeiculosScreen({required this.montadora});

  @override
  _VeiculosScreenState createState() => _VeiculosScreenState();
}

class _VeiculosScreenState extends State<VeiculosScreen> {

  @override
  Widget build(BuildContext context) {

    return Consumer2<ListaVeiculos,DeletarVeiculos>(

      builder: (_,listaVeiculos,deletarVeiculos,__){

        return Scaffold(
          backgroundColor: Color(0xFFEEEEEE),
          appBar: AppBar(
            title: Text(widget.montadora.nome),
            elevation: 0,
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CadastrarVeiculosScreen(
                    montadora: widget.montadora,
                  ),
                ),
              );
            },
            elevation: 3,
            backgroundColor: colorPrimary,
            child: Icon(Icons.add,color: Colors.white,),
          ),
          body: listaVeiculos.loading?
          Center(
            child: CircularProgressIndicator(
              color: colorPrimary,
            ),
          ):Container(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: listaVeiculos.listaVeiculos.length,
              itemBuilder: (context,index){
                return Card(
                  elevation: 3,
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 16,),
                          Image.network(
                            listaVeiculos.listaVeiculos[index].imagem,
                            //fit: BoxFit.cover,
                            height: 60,
                            width: 100,
                          ),
                          const SizedBox(width: 4,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listaVeiculos.listaVeiculos[index].nome,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                Text(
                                  "Valor: R\$ "+ formatarValor(listaVeiculos.listaVeiculos[index].valor),
                                  style: TextStyle(
                                    color: Color(0xFFe63946),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Column(
                            children: [

                              IconButton(
                                onPressed: ()async{
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => EditarVeiculosScreen(
                                        montadora: widget.montadora,
                                        veiculo: listaVeiculos.listaVeiculos[index],
                                      ),
                                    ),
                                  );
                                },
                                tooltip: "Editar",
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),

                              IconButton(
                                onPressed: ()async{

                                  await deletarVeiculos.deleteDeletarVeiculos(
                                      montadora: widget.montadora,
                                      veiculo: listaVeiculos.listaVeiculos[index],
                                    );
                                  listaVeiculos.getListaVeiculos(idMontadora: widget.montadora.id!);

                                },
                                tooltip: "Deletar",
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                              ),

                            ],
                          )

                        ],
                      ),

                      const SizedBox(height: 16,),
                    ],
                  ),
                );
              },
            ),
          ),
        );

      },

    );

  }

  String formatarValor(double valor){
    return NumberFormat.currency(locale: "pt_BR", symbol: "").format(valor);
  }

}
