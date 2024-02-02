import 'package:flutter/material.dart';
import 'package:mp_doctor/main.dart';
import 'package:provider/provider.dart';

import 'my_card.dart';

class IconTextCard extends StatelessWidget {
  final ImageProvider img;
  final String text;
  final String text2;
  final Function onTap;

  const IconTextCard(
      {Key? key,
      required this.img,
      required this.onTap,
      required this.text,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: false);
    return Padding(
        padding: const EdgeInsets.all(18),
        child: InkWell(
          onTap: onTap(),
          splashColor: const Color.fromARGB(255, 228, 205, 251),
          focusColor: provider.cardColor,
          highlightColor: provider.cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Container(
            decoration: const BoxDecoration(
              // boxShadow: const [myShadow],

              color: Colors.transparent,

              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            height: 150,
            width: 100,
            child: Stack(
              children: [
                Positioned(
                  top: 70,
                  left: 1,
                  right: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(31, 126, 118, 169),
                              blurRadius: 5,
                              offset: Offset(0, 10),
                              spreadRadius: 1,
                            )
                          ],
                          borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            h2Text(text, 16, FontWeight.w500,
                                color: provider.mylogoColor),
                            const Divider(
                              thickness: 1,
                              height: 8,
                              indent: 30,
                              endIndent: 30,
                            ),
                            h2Text(text2, 12, FontWeight.w500,
                                color: Colors.redAccent),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 1,
                  right: 1,
                  child: Center(
                    child: Image(
                      image: img,
                      width: 75,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
