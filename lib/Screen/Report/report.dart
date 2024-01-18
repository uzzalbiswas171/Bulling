import 'package:billingapps/CustomComponet/CustomText/custom_text.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTText(text: "Report", fontSize: 20, fontWeight: FontWeight.bold, textcolor: Colors.black87),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
      ),
    );
  }
}
