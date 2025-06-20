import 'package:e_commerce/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class Complainpage extends StatelessWidget {
  const Complainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Complain ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'What is wrong our app :',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFild(
            label: 'Disagreement',
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50)),
              onPressed: () {},
              child: Text(
                'Send the server !!!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
