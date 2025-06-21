import 'package:e_commerce/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    elevation: 23,
                    actions: [
                      Center(
                        child: Text(
                          'New location ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      CustomTextFild(
                        label: 'Name ',
                        controller: nameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextFild(
                          label: 'locatin', controller: locationController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Text(
                              'Remove',
                              style:
                                  TextStyle(color: Colors.indigo, fontSize: 16),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Text(
                              'Add',
                              style:
                                  TextStyle(color: Colors.indigo, fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              icon: Icon(Icons.add))
        ],
        title: Text(
          ' My Location',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'Mahmut',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text('Oguzhan 27'),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    actions: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Pozmak',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 17),
                      Text(
                        'Are you shure to delete address?',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Text(
                              'Remove',
                              style:
                                  TextStyle(color: Colors.indigo, fontSize: 16),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Text(
                              'Close',
                              style:
                                  TextStyle(color: Colors.indigo, fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
