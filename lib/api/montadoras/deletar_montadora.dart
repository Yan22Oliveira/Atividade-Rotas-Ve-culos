import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../../helpers/helpers.dart';
import '../../models/models.dart';

class DeletarMontadora extends ChangeNotifier{

  Dio dio = Dio();

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> deleteDeletarMontadora({
    required Montadora montadora,
  }) async {

    loading = true;

    try{

      final response = await dio.delete(
        api_montadoras_delete+montadora.id.toString()+".json",
      );

      if(response.statusCode == 200){
        print(response.data);
      }

    }catch(e){

    }

    loading = false;

  }

}