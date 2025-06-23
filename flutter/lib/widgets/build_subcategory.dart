// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BuildSubCategory extends StatelessWidget {
  String title;
  BuildSubCategory({
    Key? key,
     required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
