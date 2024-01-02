import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_card.dart';

const BoxShadow myShadow = BoxShadow(
  color: Color.fromARGB(31, 146, 139, 188),
  blurRadius: 18.60,
  offset: Offset(0, 20),
  spreadRadius: 0,
);

class myIcon extends StatelessWidget {
  final  IconData icon;
   final double size;
  final  Color color;
   myIcon({

  
    super.key,

     required this.icon,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [myShadow],
          color: color.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      height: 70,
      width: 70,
      child:  Center(
          child: Icon(
        icon,
        size: size,
        color: color,
      )),
    );
  }
}
