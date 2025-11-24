import 'package:flutter/material.dart';
import 'package:appli_4images/pages/niveau2_page.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  //  LOGIQUE DU MOT 
  List<String> lettresChoisies = [];
  int longueurMot = 5;  
  List<String> lettres = [
    "I","P","L","R","N","A","S","E","L","O","T","X"
  ];

  void ajouterLettre(String l) {
    if (lettresChoisies.length < longueurMot) {
      setState(() {
        lettresChoisies.add(l);
      });
    }
  }

  void supprimerLettre() {
    if (lettresChoisies.isNotEmpty) {
      setState(() {
        lettresChoisies.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "4 Images 1 Mot",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 75, 22, 87),
      ),

      backgroundColor: const Color.fromARGB(255, 8, 4, 5),

      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 75, 22, 87),
      ),

      body: 
        SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            children: [
              //      4 IMAGES
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: const Color(0xFF180208),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        imageBox("img/basket.jpg"),
                        imageBox("img/box.jpg"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        imageBox("img/course.jpg"),
                        imageBox("img/foot.jpg"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              
              //  ZONE DE SAISIE DU MOT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(longueurMot, (index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        index < lettresChoisies.length
                            ? lettresChoisies[index]
                            : "",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

            
              //     LETTRES
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: lettres.map((lettre) {
                  return ElevatedButton(
                    onPressed: () => ajouterLettre(lettre),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(55, 55),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      lettre,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              //     BOUTON SUPPRIMER
             Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

    ElevatedButton(
      onPressed: supprimerLettre,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 50),
        backgroundColor: Colors.red,
      ),
      child: const Text(
        "Supprimer",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),

    const SizedBox(width: 20), // espace entre les boutons

    GestureDetector(
      onTap: () {
        String motTape = lettresChoisies.join("");
        if (motTape == "SPORT") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Niveau2_Page()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Mot incorrect ! Réessaye."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Container(
        width: 180,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "VALIDER",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),

  ],
)


            ],
          ),
        ),
      ),

      
    );
  }
}




/// Fonction top-level pour afficher une image stylisée
Widget imageBox(String path) {
  return Container(
    width: 160,
    height: 120,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      image: DecorationImage(
        image: AssetImage(path),
        fit: BoxFit.cover,
      ),
    ),
  );
}
