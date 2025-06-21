import 'dart:ffi';

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
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Name fruit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.close)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              ' 5 (TMT)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Text(
                                  'Add to card',
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        )
                      ],
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
