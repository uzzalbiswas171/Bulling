import 'package:billingapps/CustomComponet/CustomText/custom_text.dart';
import 'package:billingapps/StateManagepent/all_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class InvoiceScreen extends StatefulWidget {
   InvoiceScreen({super.key,required this.invoice_id});
  String ? invoice_id;
  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  void initState() {
    Provider.of<AllProvider>(context,listen: false).fetchInvoiceprovider("${widget.invoice_id}");
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetStorage().read("invoice")==null? Center(child: CircularProgressIndicator(),) : Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: double.infinity,
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: Row(
                children: [
                  CustomTText(
                      text: "Money Recipt",
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      textcolor: Colors.black87),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTText(
                            text: "Mr No : 1001",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            textcolor: Colors.black87),
                        CustomTText(
                            text: "Date : 2024-01-20",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            textcolor: Colors.black87)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 3,
              color: Colors.black87,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTText(
                              text: "From",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              textcolor: Colors.black87),
                          SizedBox(
                            height: 5,
                          ),
                          CustomTText(
                              text: "Gawsia Corporation Ltd.",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              textcolor: Colors.black87),
                          CustomTText(
                              text:
                                  "Gawsia Market, Bhulta, Rupgonj, Narayanganj. \n\nRecived By: Admin",
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              textcolor: Colors.black87),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomTText(
                              text: "To",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              textcolor: Colors.black87),
                          SizedBox(
                            height: 5,
                          ),
                          CustomTText(
                              text: "${GetStorage().read("invoice")["to_name"]}",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              textcolor: Colors.black87),
                          CustomTText(
                              text: "${GetStorage().read("invoice")["to_phone"]}",
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              textcolor: Colors.black87),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Table(
                border: TableBorder.all(),
                // Allows to add a border decoration around your table
                children: [
                  TableRow(children: [
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('SI'),
                    )),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Shop Details'),
                      ),
                    )),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Rent Type'),
                    )),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Amount'),
                    )),
                  ]),
                  TableRow(children: [
                    Center(child: Text('01')),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${GetStorage().read("invoice")["shop_details"]}'),
                    )),
                    Center(child: Text('${GetStorage().read("invoice")["rent_type"]}')),
                    Center(child: Text('${GetStorage().read("invoice")["amount"]}')),
                  ]),
                ]),
            Table(
                border: TableBorder.all(),
                // Allows to add a border decoration around your table
                children: [
                  TableRow(children: [
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Amount'),
                    )),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('${GetStorage().read("invoice")["amount"]}'),
                      ),
                    )),
                  ]),
                  TableRow(children: [
                    Center(child: Text('Total Due')),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${GetStorage().read("invoice")["current_due"]}'),
                    )),
                  ]),
                ]),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomTText(text: "In Word : ", fontSize: 15, fontWeight: FontWeight.bold, textcolor: Colors.black87),
                CustomTText(text: "${GetStorage().read("invoice")["amount_in_words"]}", fontSize: 15, fontWeight: FontWeight.w600, textcolor: Colors.black87),
              ],
            )
          ],
        ),
      ),
    );
  }
}
