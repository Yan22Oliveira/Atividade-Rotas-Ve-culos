import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../mockdata/mockdata.dart';
import '../../../models/models.dart';

class VeiculosScreen extends StatefulWidget {

  final Montadora montadora;
  VeiculosScreen({required this.montadora});

  @override
  _VeiculosScreenState createState() => _VeiculosScreenState();
}

class _VeiculosScreenState extends State<VeiculosScreen> {

  List<Veiculo> get getListaVeiculosDaMontadora {
    final List<Veiculo> listaVeiculoDaMontadora = [];
    listaVeiculoDaMontadora.addAll(
        listaVeiculos.where(
                (veiculo) => veiculo.idMontadora == widget.montadora.id,
        )
    );
    return listaVeiculoDaMontadora;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        title: Text(widget.montadora.nome),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: getListaVeiculosDaMontadora.length,
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
                        getListaVeiculosDaMontadora[index].imagem,
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
                              getListaVeiculosDaMontadora[index].nome,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              "Valor: R\$ "+ formatarValor(getListaVeiculosDaMontadora[index].valor),
                              style: TextStyle(
                                color: Color(0xFFe63946),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
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

  }

  String formatarValor(double valor){
    return NumberFormat.currency(locale: "pt_BR", symbol: "").format(valor);
  }

}
