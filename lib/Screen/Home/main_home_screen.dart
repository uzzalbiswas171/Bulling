import 'package:billingapps/CustomComponet/CustomText/custom_text.dart';
import 'package:billingapps/CustomComponet/custom_button.dart';
import 'package:billingapps/Screen/Collection/collection.dart';
import 'package:billingapps/Screen/Report/report.dart';
import 'package:billingapps/StateManagepent/all_provider.dart';
import 'package:billingapps/constss.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {

  @override
  void initState() {
    Provider.of<AllProvider>(context,listen: false).fetchMarketProvider();
    GetStorage().write("DueAmount", null);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              margin: EdgeInsets.only(
                left: 15,
                top: 25,
                bottom: 10,
                right: 15
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backsection,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                 padding: EdgeInsets.only(left: 15),
                  margin: EdgeInsets.only(top: 10),
                      child:CustomTText(text: "Profile Section", fontSize: 20, fontWeight: FontWeight.w600, textcolor: Colors.black87),
                    alignment: Alignment.centerLeft,
                  ),
                  Expanded(
                    child:ListTile(
                        leading: CircleAvatar(
                          backgroundColor: customButton_color,
                          radius: 35,
                        ),
                        title: CustomTText(text: "Name : ", fontSize: 15, fontWeight: FontWeight.w600, textcolor: customTextC),
                        subtitle: CustomTText(text: "Email : ", fontSize: 15, fontWeight: FontWeight.w600, textcolor: customTextC),
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              margin: EdgeInsets.all(15),
            height: 150,
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        customButton_color: customButton_color,
                        onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionScreen(),));
                    }, text: "Collection", button_text_fontSize: 16, button_height: 150),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomButton(
                        customButton_color: customButton_color,
                        onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReportScreen(),));
                    }, text: "Report", button_text_fontSize: 16, button_height: 150),
                  )


                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}


