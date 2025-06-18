// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFild extends StatelessWidget {
  TextEditingController? controller;
  String label;
  void Function()? onTap;
  CustomTextFild({Key? key, this.controller, required this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:
          InputDecoration(border: OutlineInputBorder(), label: Text(label)),
    );
  }
}
