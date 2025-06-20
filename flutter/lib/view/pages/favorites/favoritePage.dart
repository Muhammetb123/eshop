import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.cleaning_services_outlined),
            )
          ],
          centerTitle: true,
          title: Text(
            'Favorite page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.55,
            ),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Image(image: AssetImage('assets/images/carrots.jpg')),
                  subtitle: Text('Name of products'),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                ),
              );
            }),
      ),
    );
  }
}
