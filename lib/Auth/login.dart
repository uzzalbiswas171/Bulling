import 'dart:convert';

import 'package:billingapps/CustomComponet/CustomText/custom_text.dart';
import 'package:billingapps/CustomComponet/Custom_TextForm_Field/custom_text_form_field.dart';
import 'package:billingapps/CustomComponet/custom_button.dart';
import 'package:billingapps/CustomHttp/custom_http.dart';
import 'package:billingapps/Screen/Home/main_home_screen.dart';
import 'package:billingapps/constss.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTText(text: "Login", fontSize: 30, fontWeight: FontWeight.bold, textcolor: Colors.black87),
              SizedBox(height: 20,),
              CustomTextFormField(maxline: 1, height: 60, hintext: "Enter email", controller: _emailController, obscureText: false),
              SizedBox(height: 5,),
              CustomTextFormField(maxline: 1, height: 60, hintext: "Enter password", controller: _passwordController, obscureText: true),
              Container(
                margin: EdgeInsets.only(left: 15,right: 15,top: 10),
                child: CustomButton(
                    customButton_color:customButton_color ,
                    onTap: () {
                  fetchLogin(
                    _emailController.text,
                    _passwordController.text
                  );
                }, text: "Log In", button_text_fontSize: 16, button_height: 60),
              )
            ]),
      ),
    );
  }
  fetchLogin(String email,String password)async{
    String link="${BaseUrl}/api/login";
    var body = new Map<String, dynamic>();
    body['email'] = "$email";
    body['password'] = "$password";
    // Map<String, String> headers= <String,String>{
    // "accept": "application/json" };
    try{
      Response response=await http.post(Uri.parse(link),body: body);
      print(response.body);
      var data=jsonDecode(response.body);
      GetStorage().write("api_token", data["auth_token"]);
      if(response.statusCode==200){
        Future.delayed(Duration(seconds: 1),() {
          CustomHttp().getMarketHttp();
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainHomeScreen(),));
        },);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 400),
            content: Text("Wrong Email or Password ")));
      }
    }catch(e){
      print("Login Error=== $e");
    }
  }
}
