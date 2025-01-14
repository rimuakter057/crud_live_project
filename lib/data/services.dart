
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final String?errorMessage;
  final Map <String,dynamic>? responseData;

  NetworkResponse({required this.statusCode,
  required this.isSuccess,
  this.errorMessage,this.responseData});
}

class NetworkCaller{
  // get request
static  Future <NetworkResponse> getRequest  ({required Map <String,dynamic> params,required String url}) async{
  try{
      Uri uri = Uri.parse(url);
      debugPrint("Uri : $uri");
      Response response = await get(uri);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedData);
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    }catch(e){
    return NetworkResponse(statusCode: -1,
        isSuccess: false,
    errorMessage: e.toString()
    );
  }
  }

  // post request
static  Future <NetworkResponse> postRequest  ({required Map <String,dynamic> body,required String url}) async{
  try{
    Uri uri = Uri.parse(url);
    debugPrint("Uri : $uri");
    Response response = await post(uri,
    headers: {'Content-type': 'application/json'},
    body:jsonEncode(body)
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      debugPrint(decodedData.toString());
      return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData);
    } else {
      return NetworkResponse(
        statusCode: response.statusCode,
        isSuccess: false,
      );
    }
  }catch(e){
    return NetworkResponse(statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString()
    );
  }
}

}

