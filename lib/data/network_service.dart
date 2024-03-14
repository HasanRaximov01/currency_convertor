import 'dart:convert';

import 'package:http/http.dart';

import '../domain/model/data_model.dart';

sealed  class Network{
  static Future<String?>getMethod({
    required String api,
    String baseUrl="cbu.uz",
    int?id

  })async{
    Uri uri=Uri.https(baseUrl,api);
    final response=await get(uri);
    try {
      if (response.statusCode==200) {
        return response.body;
        
      }
      
    } catch (e) {
      return null;
      
    }
    return null;

  }
  static  List<Data> parsedataList(String data){
      List<Data> list=[];
    final json=jsonDecode(data) as List;
    list=json.map((element) {
      final item=element as Map<String,Object?>;
      return Data.fromJson(item);
    }).toList();

return list;
    
  }
}