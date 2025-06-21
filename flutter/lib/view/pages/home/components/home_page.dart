import 'package:e_commerce/view/pages/home/components/new_products.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products = [
      {
        "image": "assets/images/walnuts.jpg",
        "title": "Walnuts",
        "price": "100 TMT",
      },
      {
        "image": "assets/images/apricots.jpg",
        "title": "Apricots",
        "price": "1000 TMT",
      },
      {
        "image": "assets/images/strawberries-in-hand.jpg",
        "title": "Apricots",
        "price": "1000 TMT",
      },
    ];
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('Home page')),
          body: Column(children: [
            Center(
              child: Image.asset(
                "assets/images/apple-in-hand.jpg",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Новые продукты", //Title
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewProducts(),
                          ));
                    },
                    child: Text(
                      "Показать все",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(12),
                              child: Image.asset(
                                products[index]["image"],
                                height: 110,
                                width: 110,
                              ),
                            ),
                            Positioned(
                              child: Icon(Icons.favorite, color: Colors.red),
                              top: 8,
                              right: 8,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            products[index]["title"],
                            // maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            children: [
                              Text(
                                products[index]["price"],
                                // maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shop, size: 10),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ])),
    );
  }
}
