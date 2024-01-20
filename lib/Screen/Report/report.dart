import 'dart:ffi';

import 'package:billingapps/CustomComponet/CustomText/custom_text.dart';
import 'package:billingapps/CustomComponet/custom_button.dart';
import 'package:billingapps/StateManagepent/all_provider.dart';
import 'package:billingapps/constss.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int page_id=1;
  final ScrollController _ScrollController = ScrollController();
  int count=1;
  @override
  void initState() {
    // _ScrollController.addListener(() {
    //   if(_ScrollController.offset==_ScrollController.position.maxScrollExtent){
    //     count++;
    //     setState(() {
    //       Future.delayed(Duration(seconds: 1),(){
    //         _ScrollController.jumpTo(_ScrollController.position.minScrollExtent+4);
    //       });
    //     });
    //   }if(_ScrollController.offset==_ScrollController.position.minScrollExtent){
    //     if(count==0){
    //       count=0;
    //      }else{
    //       count--;
    //     }
    //   }
    // });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final report_list = Provider.of<AllProvider>(context).report_list;
    print(count);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTText(
            text: "Report",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textcolor: Colors.black87),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: backsection,
                  borderRadius: BorderRadius.circular(11)),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: double.infinity,
                    child: Text("User Wise Search"),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 10),
                  //   height: 40,
                  //   width: double.infinity,
                  //   padding: EdgeInsets.only(left: 15, right: 15),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(11),
                  //     border: Border.all(width: 1, color: Colors.red),
                  //   ),
                  //   child: DropdownButton(
                  //     isExpanded: true,
                  //     hint: Text('Select Shop'),
                  //     // Not necessary for Option 1
                  //     value: user_name,
                  //     onChanged: (newValue) {
                  //       setState(() {
                  //         user_name = newValue.toString();
                  //
                  //         // var index = shops
                  //         //     .firstWhere((element) => element["owner_name"] == newValue);
                  //         // shop_id=index["id"];
                  //         print("shop_name $user_name");
                  //       });
                  //     },
                  //     items: user_list.map((location) {
                  //       return DropdownMenuItem(
                  //         child: Text(location),
                  //         value: location,
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                  Row(children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                  width: 1, color: Colors.black87)),
                          alignment: Alignment.center,
                          child: CustomTText(
                              text: selectedDatee == null
                                  ? "Form"
                                  : "${selectedDatee}",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              textcolor: Colors.black87),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _select2Date(context);
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                  width: 1, color: Colors.black87)),
                          alignment: Alignment.center,
                          child: CustomTText(
                              text: selected2Datee == null
                                  ? "To"
                                  : "${selected2Datee}",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              textcolor: Colors.black87),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 80,
                      child: CustomButton(
                          onTap: () {
                            if (selected2Datee != null &&
                                selectedDatee != null) {
                              Provider.of<AllProvider>(context, listen: false)
                                  .fetchReportprovider(
                                      context,
                                      "${selectedDatee}",
                                      "${selected2Datee}",
                                      "${page_id}");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: Duration(milliseconds: 400),
                                      content: Text("Search Successful")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Please Select Date")));
                            }
                          },
                          text: "Search",
                          button_text_fontSize: 15,
                          button_height: 40,
                          customButton_color: customButton_color),
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                child: ListView.builder(
                  controller: _ScrollController,
                  itemCount: report_list.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 9,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 5
                          ),
                          margin: EdgeInsets.only(
                            top: 5
                          ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTText(
                                          text:
                                          "Shop Id : ${report_list[index]["shop_id"]}",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          textcolor: Colors.black87),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: CustomTText(
                                            text:
                                            "${report_list[index]["date"]}",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            textcolor: Colors.black87),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  CustomTText(
                                      text:
                                          "Market : ${report_list[index]["market"]}",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      textcolor: Colors.black87),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  CustomTText(
                                      text:
                                          "Shop Owner Name : ${report_list[index]["shop_owner_name"]}",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      textcolor: Colors.black87),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(11),
                                bottomRight: Radius.circular(11),
                              ),
                              color: Colors.red,
                            ),
                            alignment: Alignment.center,
                            child:  CustomTText(
                                text:
                                "৳ ${report_list[index]["amount"]}",
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                textcolor: Colors.white),
                          ),
                        ],
                      ),
                    ));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///Date Picker.......................................
  String? selectedDatee;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDatee) {
      final df = new DateFormat('yyyy-MM-dd');
      setState(() {
        selectedDatee = df.format(picked);
      });
    }
  }

  ///Date Picker.......................................
  String? selected2Datee;

  Future<void> _select2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected2Datee) {
      final df = new DateFormat('yyyy-MM-dd');
      setState(() {
        selected2Datee = df.format(picked);
      });
    }
  }

  /// Shop iD list
  String? user_name;
  List user_list = ["AAA", "BBB", "CCC"];
}
