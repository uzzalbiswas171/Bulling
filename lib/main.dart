import 'package:billingapps/Auth/login.dart';
import 'package:billingapps/Screen/Home/main_home_screen.dart';
import 'package:billingapps/StateManagepent/all_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AllProvider>(create: (_) => AllProvider()),
        ],
    child :MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    //  home: MainHomeScreen(),
      home: LoginScreen(),
    ),
    );
  }
}




//GetStorage().write("DueAmount", data[data]);
//GetStorage().write("invoice", data["data"]);