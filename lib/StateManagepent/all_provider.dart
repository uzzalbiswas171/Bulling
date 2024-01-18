

import 'package:billingapps/CustomHttp/custom_http.dart';
import 'package:flutter/material.dart';

class AllProvider with ChangeNotifier{

  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  List markets=[];
  fetchMarketProvider()async{
    markets=await CustomHttp().getMarketHttp();
  }


}