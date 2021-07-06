import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../api/api.dart';
import '../../common/common.dart';
import '../../helpers/helpers.dart';

import '../veiculos/veiculos_screen.dart';
import '../cadastrar_montadora/cadastrar_montadora_screen.dart';
import '../editar_montadora/editar_montadora_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Consumer2<ListaMontadoras,DeletarMontadora>(

      builder: (_,listaMontadoras,deletarMontadora,__){

        return Scaffold(
          drawer: CustomDrawer(),
          backgroundColor: Color(0xFFEEEEEE),
          appBar: AppBar(
            title: Text("Montadoras"),
            elevation: 0,
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CadastrartMontadoraScreen(),
                ),
              );
            },
            elevation: 3,
            backgroundColor: colorPrimary,
            child: Icon(Icons.add,color: Colors.white,),
          ),
          body: listaMontadoras.loading?
          Center(
            child: CircularProgressIndicator(
              color: colorPrimary,
            ),
          ):
          ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(16),
                itemCount: listaMontadoras.listaMontadoras.length,
                itemBuilder: (context,index){
                  return GestureDetector(

                    onTap: deletarMontadora.loading?null:(){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VeiculosScreen(montadora: listaMontadoras.listaMontadoras[index],),
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
                        height: 100,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 60,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            listaMontadoras.listaMontadoras[index].nome,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              letterSpacing: 2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap:deletarMontadora.loading?null: ()async{

                                           await deletarMontadora.deleteDeletarMontadora(
                                               montadora: listaMontadoras.listaMontadoras[index],
                                           );

                                           listaMontadoras.getListaMontadoras();

                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        const SizedBox(width: 20,),
                                        GestureDetector(
                                          onTap:deletarMontadora.loading?null: (){
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => EditarMontadoraScreen(montadora: listaMontadoras.listaMontadoras[index],),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16,),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 40,
                              child: Container(
                                color: Colors.white,
                                child: Image.network(
                                  listaMontadoras.listaMontadoras[index].imagem,
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, url, error) => Container(height: 60,width: 60,child: Icon(Icons.error,color: Colors.grey,)),
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
            ],
          ),
        );

      },

    );

  }
}
