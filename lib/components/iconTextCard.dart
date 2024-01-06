import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_card.dart';

class IconTextCard extends StatelessWidget {
  final ImageProvider img;
  final String text;
  final String text2;

  const IconTextCard(
      {Key? key, required this.img, required this.text, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Color.fromARGB(255, 215, 90, 96),
      focusColor: myCardColor,
      highlightColor: myCardColor,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Container(
        decoration: BoxDecoration(
          // boxShadow: const [myShadow],
          color: myCardColor,

          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        height: 120,
        width: 95,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(31, 126, 118, 169),
                    blurRadius: 5,
                    offset: Offset(0, 10),
                    spreadRadius: 1,
                  )
                ],
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Image(
                image: img,
                width: 56,
              ),
            ),
            h2Text(text, 18, FontWeight.w500),
            Divider(
              thickness: 1,
              height: 8,
              indent: 30,
              endIndent: 30,
              color: Colors.red.withOpacity(0.6),
            ),
            h2Text(text2, 12, FontWeight.normal)
          ],
        ),
      ),
    );
  }
}
