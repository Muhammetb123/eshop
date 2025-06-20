import 'package:flutter/material.dart';

class Cartpage extends StatelessWidget {
  
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Order page',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white24,
                  child: ListTile(
                    leading: Image(
                      image: AssetImage(
                        'assets/images/carrots.jpg',
                      ),
                    ),
                    title: Text(
                      'Carrots',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '1000 (TMT)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.delete,
                      color: const Color.fromARGB(255, 199, 64, 43),
                    ),
                  ),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.orange),
                  onPressed: () {},
                  child: Text(
                    'Order ->',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
