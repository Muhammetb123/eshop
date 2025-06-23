import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white12,
          title: Text(
            'Favorite page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              elevation: 25,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image(
                      width: 100,
                      image: AssetImage(
                        'assets/images/apricots.jpg',
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name fruit apaoko iciesm',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.close),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  ' 5 (TMT)',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Text(
                                  'Add',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
