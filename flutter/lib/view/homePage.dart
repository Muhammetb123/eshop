import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products = [
      {
        "image":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Gutenberg_Bible%2C_Lenox_Copy%2C_New_York_Public_Library%2C_2009._Pic_01.jpg/500px-Gutenberg_Bible%2C_Lenox_Copy%2C_New_York_Public_Library%2C_2009._Pic_01.jpg",
        "title": "BOOK",
        "price": "100 TMT",
      },
      {
        "image":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/2019_Toyota_Corolla_Icon_Tech_VVT-i_Hybrid_1.8.jpg/330px-2019_Toyota_Corolla_Icon_Tech_VVT-i_Hybrid_1.8.jpg",
        "title": "CAR",
        "price": "1000 TMT",
      },
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Home page')),
        body: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .85,
          ),
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(12),
                        child: Image.network(
                          products[index]["image"],
                          height: 110,
                          width: double.infinity,
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
    );
  }
}
