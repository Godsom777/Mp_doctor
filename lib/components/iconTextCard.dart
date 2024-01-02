// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_card.dart';

class IconTextCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconTextCard({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [myShadow],
          color: myCardColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      height: 150,
      width: 125,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 43,
            color: logoColor,
          ),
          h2Text(text, 25, FontWeight.w400),
          const Divider(
            thickness: 2,
            height: 10,
            indent: 30,
            endIndent: 30,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
