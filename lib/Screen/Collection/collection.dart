import 'package:billingapps/CustomComponet/CustomText/custom_text.dart';
import 'package:billingapps/CustomComponet/custom_button.dart';
import 'package:billingapps/StateManagepent/all_provider.dart';
import 'package:billingapps/constss.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  void initState() {
    Provider.of<AllProvider>(context,listen: false).fetchMarketProvider();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   final markets= Provider.of<AllProvider>(context).markets;
   print(markets);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTText(text: "Collection", fontSize: 20, fontWeight: FontWeight.bold, textcolor: Colors.black87),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(child: CustomButton(
                     customButton_color:   is_market==true?  customButton_color:Colors.black87,
                      onTap: () {
                    setState(() {
                      is_market=!is_market;
                    });
                  }, text: "Search by market", button_text_fontSize: 16, button_height: 60)),
SizedBox(
  width: 15,
),
                  Expanded(child: CustomButton(
                      customButton_color:is_market==true? Colors.black87:customButton_color ,
                      onTap: () {
                    setState(() {
                      is_market=!is_market;
                    });
                  }, text: "Shop ID", button_text_fontSize: 16, button_height: 60)),

                ],
              ),
            ),
            is_market==true?Container(
               child: Column(
                 children: [
                   Container(
                     margin: EdgeInsets.all(15),
                     height: 40,
                     width: double.infinity,
                     padding: EdgeInsets.only(left: 15,right: 15),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(11),
                       border: Border.all(width: 1,color: Colors.red),
                     ),
                     child:DropdownButton(
                       enableFeedback: true,
                       autofocus: false,
                       isExpanded: true,
                       hint: Text('Select Markets'), // Not necessary for Option 1
                       value: market_name,
                       onChanged: (newValue) {
                         setState(() {
                           market_name = newValue.toString();
                           print(market_name);
                         });
                       },
                       items: market_list!.map((location) {
                         return DropdownMenuItem(
                           child:  Text(location),
                           value: location,
                         );
                       }).toList(),
                     ),
                   ),
                   market_name==null ?Container() :Container(
                     margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                     height: 40,
                     width: double.infinity,
                     padding: EdgeInsets.only(left: 15,right: 15),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(11),
                       border: Border.all(width: 1,color: Colors.red),
                     ),
                     child:DropdownButton(
                         isExpanded: true,
                       hint: Text('Select Floor'), // Not necessary for Option 1
                       value: floor_name,
                       onChanged: (newValue) {
                         setState(() {
                           floor_name = newValue.toString();
                           print(floor_name);
                         });
                       },
                       items: floor_list!.map((location) {
                         return DropdownMenuItem(
                           child:  Text(location),
                           value: location,
                         );
                       }).toList(),
                     ),
                   ),
                   market_name==null || floor_name==null?Container(): Container(
                     margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                     height: 40,
                     width: double.infinity,
                     padding: EdgeInsets.only(left: 15,right: 15),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(11),
                       border: Border.all(width: 1,color: Colors.red),
                     ),
                     child:DropdownButton(
                       isExpanded: true,
                       hint: Text('Select Block'), // Not necessary for Option 1
                       value: block_name,
                       onChanged: (newValue) {
                         setState(() {
                           block_name = newValue.toString();
                           print(block_name);
                         });
                       },
                       items: block_list!.map((location) {
                         return DropdownMenuItem(
                           child:  Text(location),
                           value: location,
                         );
                       }).toList(),
                     ),
                   ),
                   market_name==null || floor_name==null || block_name==null?Container():
                   Container(
                     margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                     height: 40,
                     width: double.infinity,
                     padding: EdgeInsets.only(left: 15,right: 15),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(11),
                       border: Border.all(width: 1,color: Colors.red),
                     ),
                     child:DropdownButton(
                       isExpanded: true,
                       hint: Text('Select Shop'), // Not necessary for Option 1
                       value: shop_name,
                       onChanged: (newValue) {
                         setState(() {
                           shop_name = newValue.toString();
                           print("shop_name");
                         });
                       },
                       items: shop_list!.map((location) {
                         return DropdownMenuItem(
                           child:  Text(location),
                           value: location,
                         );
                       }).toList(),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 15),
                     child: CustomButton(
                         customButton_color:customButton_color ,
                         onTap: () {
                     }, text: "Search", button_text_fontSize: 15, button_height: 50),
                   ),
                 ],
               ),
             ):Column(
               children: [
                 Container(
                  margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  height: 40,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15,right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(width: 1,color: Colors.red),
                  ),
                  child:DropdownButton(

                    isExpanded: true,
                    hint: Text('Select Shop'), // Not necessary for Option 1
                    value: shop_name,
                    onChanged: (newValue) {
                      setState(() {
                        shop_name = newValue.toString();
                        print("shop_name");
                      });
                    },
                    items: shop_list!.map((location) {
                      return DropdownMenuItem(
                        child:  Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                             ),
                 Padding(
                   padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 15),
                   child: CustomButton(
                       customButton_color:customButton_color ,

                       onTap: () {
                   }, text: "Search", button_text_fontSize: 15, button_height: 50),
                 ),
               ],
             ),
       ],
        ),
      ));
  }



  bool is_market=true;

  String ? market_name;
  List market_list=["AAA","BBB","CCC"];

  /// floor list
  String ? floor_name;
  List floor_list=["AAA","BBB","CCC"];

  /// block list
  String ? block_name;
  List block_list=["AAA","BBB","CCC"];

  /// block list
  String ? shop_name;
  List shop_list=["AAA","BBB","CCC"];
  /// Shop iD list
  String ? shopid_name;
  List shopid_list=["AAA","BBB","CCC"];
}
