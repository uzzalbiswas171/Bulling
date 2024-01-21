

import 'package:billingapps/CustomHttp/custom_http.dart';
import 'package:flutter/material.dart';

class AllProvider with ChangeNotifier{

  List markets=[];
  fetchMarketProvider()async{
    markets=await CustomHttp().getMarketHttp();
    notifyListeners();
  }

  List floors=[];
  fetchfloorprovider(String market_id,String floor_id,String block_id,String Shop_id)async{
    floors=await CustomHttp().getFloorHttp(
      market_id,floor_id,block_id,Shop_id
    );
    notifyListeners();
  }


  List blocks=[];
  fetchBlockprovider(String floor_id)async{
    blocks=await CustomHttp().getBlockHttp(
        floor_id
    );
    notifyListeners();
  }

  List shops=[];
  fetchShopprovider(String block_id)async{
    shops=await CustomHttp().getShopHttp(
        block_id
    );
    notifyListeners();
  }



  fetchDueAmmountprovider(String shop_id)async{
  final data =await CustomHttp().getDueAmmountHttp(
      shop_id
    );
  notifyListeners();
  }

  fetchDueAmmounByShopIDprovider(String shop_id)async{
  final data =await CustomHttp().getDueAmmounByShopIDtHttp(
      shop_id
    );
  notifyListeners();
  }



  fetchfetchRentCollectionprovider(BuildContext context,String rent_Id,String amount)async{
  final data =await CustomHttp().fetchRentCollection(context,rent_Id, amount);
  notifyListeners();
  }

  dynamic invoice;
  fetchInvoiceprovider(String invoice_id)async{
   invoice =await CustomHttp().getInvoiceHttp(invoice_id);
  notifyListeners();
  }


  List report_list=[];
  fetchReportprovider(BuildContext context ,String f_date,String l_date,String page_id)async{
    report_list=await CustomHttp().getReportHttp(context,f_date, l_date, page_id);
    notifyListeners();
  }

}