import 'package:currency_convertor/core/api.dart';
import 'package:currency_convertor/data/network_service.dart';
import 'package:currency_convertor/domain/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
group("Convertor test", () { 
  test("Method get test", ()async{
 final response= await Network.getMethod(api: Apis.apiconvertor);
 debugPrint(response);
    expect(response, isNotNull);
    debugPrint(response);
  });
  test("Parse Data to List ", ()async {
    final data= await Network.getMethod(api: Apis.apiconvertor);
  final list = Network.parsedataList(data!);
 debugPrint(list.toString());
  expect(list, const TypeMatcher<List<Data>>());


  });


});
}