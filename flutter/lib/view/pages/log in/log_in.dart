import 'package:e_commerce/view/pages/log%20in/information.dart';
import 'package:e_commerce/view/pages/log%20in/location.dart';
import 'package:e_commerce/widgets/container_witget.dart';
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
        appBar: AppBar(
          title: Text(
            'Account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            //egerde maglumat bos bolsa su cykmaly egerde maglumat add edilen bolsa onda
            children: [
              SizedBox(
                height: 10,
              ),
              CustomTextFild(
                controller: numberController,
                label: 'Phone number',
              ),
              SizedBox(
                height: 29,
              ),
              CustomTextFild(
                controller: nameController,
                label: 'Name',
              ),
              SizedBox(
                height: 15,
              ),
              ContainerWitget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Location(),
                    ),
                  );
                },
                containerName: 'Deliwer',
                icon: Icons.arrow_forward_ios_outlined,
              ),
              SizedBox(
                height: 15,
              ),
              ContainerWitget(
                containerName: 'Orders',
                icon: Icons.arrow_forward_ios_outlined,
              ),
              SizedBox(
                height: 15,
              ),
              ContainerWitget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Information(),
                    ),
                  );
                },
                containerName: 'Information about us',
                icon: Icons.arrow_forward_ios_outlined,
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 15, 83, 139),
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {},
                child: Text(
                  'Yatda sakla',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
