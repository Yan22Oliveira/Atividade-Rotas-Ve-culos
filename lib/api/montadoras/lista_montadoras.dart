import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../../helpers/helpers.dart';
import '../../models/models.dart';

class ListaMontadoras extends ChangeNotifier{

  ListaMontadoras(){
    getListaMontadoras();
  }

  Dio dio = Dio();

  List<Montadora> listaMontadoras = [];

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> getListaMontadoras() async {

    loading = true;
    listaMontadoras.clear();

    try{

      final response = await dio.get(
        api_montadoras,
      );

      if(response.statusCode == 200){

        Map<String, dynamic> data = new Map<String, dynamic>.from(response.data);

        data.forEach((key, value) {
          Montadora montadora = Montadora.fromJson(value,key);
          listaMontadoras.add(montadora);
        });

      }else{
        listaMontadoras.clear();
      }

    }catch(e){
      listaMontadoras.clear();
    }

    loading = false;

  }

}