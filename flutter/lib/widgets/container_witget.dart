// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ContainerWitget extends StatelessWidget {
  String containerName;
  void Function()? onTap;
  IconData? icon;
  ContainerWitget({
    Key? key,
    required this.containerName,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: BoxBorder.all(width: 2, color: Colors.black54),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          title: Text(containerName),
          trailing: Icon(
            icon,
            size: 18,
          ),
        ),
      ),
    );
  }
}
