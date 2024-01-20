import 'package:billingapps/CustomComponet/CustomText/custom_text.dart';
import 'package:billingapps/CustomComponet/Custom_TextForm_Field/custom_text_form_field.dart';
import 'package:billingapps/CustomComponet/custom_button.dart';
import 'package:billingapps/StateManagepent/all_provider.dart';
import 'package:billingapps/constss.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {

  late int market_id;
  late int floor_id;
  late int block_id;
  late int shop_id;
  final _amountController=TextEditingController();
  final _shopIdController=TextEditingController();
  bool is_done_search=false;
  @override
  void initState() {
    GetStorage.init();
    Provider.of<AllProvider>(context, listen: false).fetchMarketProvider();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final markets = Provider.of<AllProvider>(context).markets;
    final floors = Provider.of<AllProvider>(context).floors;
    final blocks = Provider.of<AllProvider>(context).blocks;
    final shops = Provider.of<AllProvider>(context).shops;
    print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvv  =  > ${GetStorage().read("DueAmount")}");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTText(
            text: "Collection",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textcolor: Colors.black87),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                            customButton_color: is_market == true
                                ? customButton_color
                                : Colors.black87,
                            onTap: () {
                              GetStorage().write("DueAmount",null);
                              setState(() {
                                is_done_search=false;
                                is_market = !is_market;
                              });
                            },
                            text: "Search by market",
                            button_text_fontSize: 16,
                            button_height: 60)),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: CustomButton(
                            customButton_color: is_market == true
                                ? Colors.black87
                                : customButton_color,
                            onTap: () {
                              GetStorage().write("DueAmount",null);
                              setState(() {
                                is_done_search=false;
                                is_market = !is_market;
                              });
                            },
                            text: "Shop ID",
                            button_text_fontSize: 16,
                            button_height: 60)),
                  ],
                ),
              ),
              is_market == true
                  ? Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            height: 40,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(width: 1, color: Colors.red),
                            ),
                            child: DropdownButton(
                              enableFeedback: true,
                              autofocus: false,
                              isExpanded: true,
                              hint: Text('Select Markets'),
                              // Not necessary for Option 1
                              value: market_name,
                              onChanged: (newValue) {
                                setState(() {
                                  market_name = newValue.toString();
                                  var index = markets
                                      .firstWhere((element) => element["name"] == newValue);
                                  market_id=index["id"];
                                  Provider.of<AllProvider>(context,listen:false).fetchfloorprovider("${market_id}", "floor_id", "block_id", "Shop_id");
          
                                });
                              },
                              items: markets.map((location) {
                                return DropdownMenuItem(
                                  child: Text(location["name"]),
                                  value: location["name"],
                                );
                              }).toList(),
                            ),
                          ),
                          market_name == null
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 15),
                                  height: 40,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border:
                                        Border.all(width: 1, color: Colors.red),
                                  ),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text('Select Floor'),
                                    // Not necessary for Option 1
                                    value: floor_name,
                                    onChanged: (newValue) {
                                      setState(() {
                                        floor_name = newValue.toString();
                                        print(floor_name);
                                        var index = floors
                                            .firstWhere((element) => element["name"] == newValue);
                                        floor_id=index["id"];
                                        Provider.of<AllProvider>(context,listen:false).fetchBlockprovider("${floor_id}");
          
                                      });
                                    },
                                    items: floors.map((location) {
                                      return DropdownMenuItem(
                                        child: Text(location["name"]),
                                        value: location["name"],
                                      );
                                    }).toList(),
                                  ),
                                ),
                          market_name == null || floor_name == null
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 15),
                                  height: 40,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border:
                                        Border.all(width: 1, color: Colors.red),
                                  ),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text('Select Block'),
                                    // Not necessary for Option 1
                                    value: block_name,
                                    onChanged: (newValue) {
                                      setState(() {
                                        block_name = newValue.toString();
                                        print(block_name);
                                        var index = blocks
                                            .firstWhere((element) => element["name"] == newValue);
                                        block_id=index["id"];
                                        Provider.of<AllProvider>(context,listen:false).fetchShopprovider("${block_id}");
          
                                      });
                                    },
                                    items: blocks.map((location) {
                                      return DropdownMenuItem(
                                        child: Text(location["name"]),
                                        value: location["name"],
                                      );
                                    }).toList(),
                                  ),
                                ),
                          market_name == null ||
                                  floor_name == null ||
                                  block_name == null
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 15),
                                  height: 40,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    border:
                                        Border.all(width: 1, color: Colors.red),
                                  ),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Text('Select Shop'),
                                    // Not necessary for Option 1
                                    value: shop_name,
                                    onChanged: (newValue) {
                                      setState(() {
                                        shop_name = newValue.toString();
          
                                        var index = shops
                                            .firstWhere((element) => element["owner_name"] == newValue);
                                        shop_id=index["id"];
                                        print("shop_name $shop_id" );
                                      });
                                    },
                                    items: shops.map((location) {
                                      return DropdownMenuItem(
                                        child: Text(location["owner_name"]),
                                        value: location["owner_name"],
                                      );
                                    }).toList(),
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15, bottom: 15),
                            child: CustomButton(
                                customButton_color: customButton_color,
                                onTap: () {
                                  setState(() {
                                    is_done_search=true;
                                  });
                                  Provider.of<AllProvider>(context,listen:false).fetchDueAmmountprovider("${shop_id}");
                                },
                                text: "Search",
                                button_text_fontSize: 15,
                                button_height: 50),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                  Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(width: 1,color: Colors.black87)
                  ),
                  child:TextFormField(
                    controller: _shopIdController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15,bottom: 0,top: 0),
                      hintText: "Enter Shop ID",
                    ),
                  )
              ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 15),
                          child: CustomButton(
                              customButton_color: customButton_color,
                              onTap: () {
                                setState(() {
                                  is_done_search=true;
                                });
                                if(_shopIdController.text.isNotEmpty){
                                  Provider.of<AllProvider>(context,listen: false).fetchDueAmmounByShopIDprovider(_shopIdController.text);
                                  setState(() {
                                    _shopIdController.text="";
                                  });
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter Shop ID')));
                                }
                              },
                              text: "Search",
                              button_text_fontSize: 15,
                              button_height: 50),
                        ),
                      ],
                    ),
          
              is_done_search==true?  Container(
                margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: backsection
                ),
                child: Column(
                  children: [
                    Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(width: 1,color: Colors.black87)
                        ),
                        child:CustomTText(text:GetStorage().read("DueAmount")==null?"Total Due : 0": "Total Due : ${GetStorage().read("DueAmount")["due"]}", fontSize: 17, fontWeight: FontWeight.w800, textcolor: Colors.black87),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(width: 1,color: Colors.black87)
                            ),
                           child:TextFormField(
                             controller: _amountController,
                             decoration: InputDecoration(
                               border: InputBorder.none,
                               contentPadding: EdgeInsets.only(left: 15,bottom: 0,top: 0),
                               hintText: "Enter Amount",
                             ),
                           )
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(11),
                                //  border: Border.all(width: 1,color: Colors.black87)
                              ),
                              child:    CustomButton(onTap: () {
                                if(_amountController.text.isNotEmpty){
                                  Provider.of<AllProvider>(context,listen: false).fetchfetchRentCollectionprovider(context,"${GetStorage().read("DueAmount")["rent_id"]}", _amountController.text);
                                  setState(() {
                                    _amountController.text="";
                                  });
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter Amount')));
                                }
          
                                }, text: "Paid", button_text_fontSize: 15, button_height: 50, customButton_color: customButton_color)
          
                          ),
                        ),
                      ],
                    ),
          
                  ],
                ),
              ):Container(),
            ],
          ),
        ),
      ),
    );
  }

  bool is_market = true;
  String? market_name;

  /// floor list
  String? floor_name;

  /// block list
  String? block_name;

  /// block list
  String? shop_name;

  /// Shop iD list
  String? shopid_name;
  List shopid_list = ["AAA", "BBB", "CCC"];
}
