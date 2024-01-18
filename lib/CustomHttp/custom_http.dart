import 'dart:convert';

import 'package:billingapps/constss.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class CustomHttp{


  // var body = new Map<String, dynamic>();
  // body['email'] = "$email";
  // body['password'] = "$password";
  Map<String, String> headers= <String,String>{
    "accept": "application/json",
    'Authorization': 'Bearer ${GetStorage().read("api_token")}'
  };

  ///-----User Profile ------------///
  List markets=[];
  Future<List> getMarketHttp() async {
    print("tokennnnnnnnnn ==>${GetStorage().read("api_token")}");
    try{
      Response response = await http.get(
        Uri.parse('${BaseUrl}/api/markets'),headers: headers
      );
      print(response.body);
      var data = jsonDecode(response.body);
       markets = data['data'];

    }catch(e){
      print(e);
    }
    return markets;
  }

}