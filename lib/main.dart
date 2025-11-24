import 'package:flutter/material.dart';
import 'package:appli_4images/pages/accueil.dart';
import 'package:appli_4images/pages/niveau2_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Angels'), 
      home: AccueilPage(),

       );
       
  }
}
