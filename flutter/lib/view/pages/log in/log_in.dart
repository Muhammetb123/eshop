import 'package:e_commerce/view/pages/log%20in/complainPage.dart';
import 'package:e_commerce/view/pages/log%20in/information.dart';
import 'package:e_commerce/view/pages/log%20in/userList.dart';
import 'package:e_commerce/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Complainpage(),
              ),
            );
          },
          child: Icon(Icons.warning),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Userlist(),
                  ),
                );
              },
              icon: Icon(Icons.menu),
            )
          ],
          centerTitle: true,
          title: Text(
            'Account',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
        ),
        body: Column(
          //egerde maglumat bos bolsa su cykmaly egerde maglumat add edilen bolsa onda
          children: [
            SizedBox(
              height: 17,
            ),
            CustomTextFild(
              controller: nameController,
              label: 'Name',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFild(
              controller: numberController,
              label: 'Phone number',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFild(
              label: 'e-mail pocta',
              controller: emailController,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20))),
              onPressed: () {},
              child: Text('Add'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Information(),
                  ),
                );
              },
              child: Text('Information about us'),
            )
          ],
        ),
      ),
    );
  }
}
