import 'package:flutter/material.dart';
import 'package:bankhoo/data/data.dart';

class Page1 extends StatefulWidget {
  final List<String> listArticles;
  final String imageUrl = "https://placehold.co/300x400.png";
  const Page1({Key? key, required this.listArticles}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.45; // ajustez ce nombre selon vos préférences


    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produits'),
      ),
      body: GridView.builder(
        itemCount: widget.listArticles.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),

      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // action à effectuer lorsqu'un élément est tapé
          },
          child: Card(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(widget.imageUrl, fit: BoxFit.cover, width: double.infinity, height: 200,),
                ),
                const SizedBox(height: 8.0,),
                Text(widget.listArticles[index]),
                Padding(
                  padding: const EdgeInsets.all(10),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            Data.favoris.add(widget.listArticles[index]);
                          });
                          // action à effectuer lorsqu'on appuie sur l'icône favori
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          // action à effectuer lorsqu'on appuie sur l'icône panier
                        },
                      ),
                    ],
                  ), 
                ),
              ],
            ),
          ),
        );
  },
),

    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App Page 2'),
      ),
      body: const Center(
        child: Text('Welcome to page 2!'),
      ),
    );
  }
}