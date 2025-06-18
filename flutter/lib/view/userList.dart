import 'package:flutter/material.dart';

class Userlist extends StatelessWidget {
  const Userlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User list'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Mahmut'),
              subtitle: Text('+993 6* ******'),
              trailing: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
