import 'package:flutter/material.dart';

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("4 Images 1 Mot",
      style: TextStyle(fontWeight: FontWeight.bold,
                       fontSize: 20,
                      color: const Color.fromARGB(255, 69, 41, 77)),),
                       centerTitle: true,),

         drawer: Drawer(),
         
    body: Center(
        child: Text("Accueil"),
      ),
    );
  }
}