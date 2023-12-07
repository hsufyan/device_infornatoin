import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_information/view/save_information.dart';
import 'package:device_information/view/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
 
}

 
 

  

   


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Information()
    );
  }
}

