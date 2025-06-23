import 'package:e_commerce/view/pages/home/components/new_products.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categoryNames = [
      "Новые продукты",
      "Рекомендуемые продукты",
      "Скидки и акции",
      "Мясная продукция",
      "Хлебобулочные изделия",
      "Макаронные изделия и крупы"
    ];

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
          body: ListView(children: [
            Center(
              child: Image.asset(
                "assets/images/milkshake.jpg",
              ),
            ),
            ...categoryNames.map(
              (e) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
                            width: 200,
                            child: Text(
                              e, // Category
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(),
                          child: Text(
                            "Показать все",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewProducts(),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 160,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(12),
                                      child: Image.asset(
                                        products[index]["image"],
                                        // height: 110,
                                        // width: 110,
                                      ),
                                    ),
                                    Positioned(
                                        top: 8,
                                        right: 8,
                                        height: 33,
                                        width: 33,
                                        child: IconButton(
                                          iconSize: 18,
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                      Colors.white),
                                              elevation:
                                                  WidgetStateProperty.all(20)),
                                          onPressed: () {},
                                          icon: Icon(Icons.add),
                                        )

                                        // Icon(Icons.add, color: Colors.red),
                                        ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Text(
                                    products[index]["title"],
                                    // maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
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
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
