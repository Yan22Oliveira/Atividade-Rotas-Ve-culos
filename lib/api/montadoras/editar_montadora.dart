import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../../helpers/helpers.dart';
import '../../models/models.dart';

class EditarMontadora extends ChangeNotifier{

  Dio dio = Dio();

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> patchEditarMontadora({
    required Montadora montadora,
    required Function(String) onSuccess,
    required Function(String) onFail,
  }) async {

    loading = true;

    var corpo = json.encode({
      "nome":montadora.nome,
      "imagem":montadora.imagem,
    });

    try{

      final response = await dio.patch(
        api_montadoras_editar+montadora.id.toString()+".json",
        data: corpo,
      );

      if(response.statusCode == 200){
        Map<String, dynamic> data = new Map<String, dynamic>.from(response.data);
        if(data.containsKey('nome')){
          onSuccess("Montadora atualizado com sucesso!");
        }else{
          onFail("Erro ao atualizar montadora!");
        }
      }else{
        onFail("Erro ao atualizar montadora!");
      }

    }catch(e){
      onFail("Erro ao atualizar montadora!");
    }

    loading = false;

  }

}