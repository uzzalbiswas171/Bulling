import 'dart:convert';

import 'package:billingapps/Screen/Invoice/invoice.dart';
import 'package:billingapps/constss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  ///-----Market List ------------///
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

  ///-----Floor List ------------///
  List floors=[];
  Future<List> getFloorHttp(String market_id,String floor_id,String blook_id,String Shop_id) async {
    print("tokennnnnnnnnn ==>${GetStorage().read("api_token")}");
    try{
      Response response = await http.get(
        Uri.parse('${BaseUrl}/api/floors/${market_id}'),headers: headers
      );
      print(response.body);
      var data = jsonDecode(response.body);
      floors = data['data'];
    }catch(e){
      print(e);
    }
    return floors;
  }
  ///-----Block List ------------///
  List blocks=[];
  Future<List> getBlockHttp(String floor_id) async {
    print("tokennnnnnnnnn ==>${GetStorage().read("api_token")}");
    try{
      Response response = await http.get(
        Uri.parse('${BaseUrl}/api/blocks/$floor_id'),headers: headers
      );
      print(response.body);
      var data = jsonDecode(response.body);
       blocks = data['data'];
    }catch(e){
      print(e);
    }
    return blocks;
  }
  ///-----Shop List ------------///
  List shops=[];
  Future<List> getShopHttp(String block_id) async {
    print("tokennnnnnnnnn ==>${GetStorage().read("api_token")}");
    try{
      Response response = await http.get(
        Uri.parse('${BaseUrl}/api/shops/$block_id'),headers: headers
      );
      print("shoppppppppppppppppppppppppppp====> ${response.body}");
      var data = jsonDecode(response.body);
      shops = data['data'];
    }catch(e){
      print(e);
    }
    return shops;
  }

  ///-----DeuAmount Section  ------------///

    getDueAmmountHttp(String shop_id) async {
    print("tokennnnnnnnnn ==>${GetStorage().read("api_token")}");
    print(shop_id);
    try{
      Response response = await http.get(
        Uri.parse('${BaseUrl}/api/rent-due-amount/${shop_id}'),headers: headers
      );
      print("Due Amount  ====> ${response.body}");
      var data = jsonDecode(response.body);
      print(data);
      GetStorage().write("DueAmount", data["data"]);
    }catch(e){
      print(e);
    }
  }
  ///-----DeuAmount Section  ------------///

    getDueAmmounByShopIDtHttp(String shop_id) async {
    print("tokennnnnnnnnn ==>${GetStorage().read("api_token")}");
    print(shop_id);
    try{
      Response response = await http.get(
        Uri.parse('${BaseUrl}/api/rent-due-amount-shopid/${shop_id}'),headers: headers
      );
      print("Due Amount  ====> ${response.body}");
      var data = jsonDecode(response.body);
      print(data);
      GetStorage().write("DueAmount", data["data"]);
    }catch(e){
      print(e);
    }
  }



  /// REnt Collection
  fetchRentCollection(BuildContext context,String rent_Id,String amount)async{
    String link="${BaseUrl}/api/rent-collection";
    var body = new Map<String, dynamic>();
    body['rent_id'] = "$rent_Id";
    body['amount'] = "$amount";
    print("$rent_Id  $amount" );
    try{
      Response response=await http.post(Uri.parse(link),body: body,headers: headers);
      print(response.body);
      var data=jsonDecode(response.body);
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${amount}");
      if(response.statusCode==200){

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 500),
            content: Text("Paid Successful")));
        GetStorage().write("DueAmount", null);
        Future.delayed(Duration(milliseconds: 300),() {
          getInvoiceHttp("${data["data"]["invoice_id"]}");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InvoiceScreen(
            invoice_id:"${data["data"]["invoice_id"]}" ,
          ),));
        },);
      }else{
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     duration: Duration(milliseconds: 400),
        //     content: Text("Wrong Email or Password ")));
      }
    }catch(e){
      print("rent collection=== $e");
    }
  }


  ///-----Get Report Section  ------------///
List report_list=[];
  getReportHttp(BuildContext context ,String f_date,String l_date,String PageId) async {
    print("tokennnnnnnnnn ==>${GetStorage().read("api_token")}");
    try{
      Response response = await http.get(
          Uri.parse('${BaseUrl}/api/user-collection-report?from_date=${f_date}&to_date=${l_date}&page=${PageId}'),headers: headers
      );
      print("report_list  ====> ${response.body}");
      var data = jsonDecode(response.body);
      report_list=data["data"]["data"];
    }catch(e){
      print(e);
    }
    return report_list;
  }


  ///-----DeuAmount Section  ------------///

  getInvoiceHttp(String invoice_id) async {
    print("tokennnnnnnnnn ==>${GetStorage().read("api_token")}");
    print(invoice_id);
    try{
      Response response = await http.get(
          Uri.parse('https://bill.matrechaya.com/api/rent-collection-invoice/${invoice_id}'),headers: headers
      );
      print("invoice  ====> ${response.body}");
      var data = jsonDecode(response.body);
      print(data);
      GetStorage().write("invoice", data["data"]);
    }catch(e){
      print(e);
    }
  }
}