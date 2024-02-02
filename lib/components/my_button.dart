import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
            color: provider.cardColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: provider.myshadowColor.withOpacity(
                    .25), // change the opacity to darken or lighten the shadiw
              )
            ]),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: provider.mylogoColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
