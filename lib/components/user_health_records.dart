import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const BoxShadow myShadow = BoxShadow(
  color: Color.fromARGB(31, 146, 139, 188),
  blurRadius: 18.60,
  offset: Offset(0, 20),
  spreadRadius: 0,
);

const Color myCardColor = Color(0xffFBFDFA); //soft white color
Color logoColor = const Color(0xff3F3F69);
//get the logo color
DateTime now = DateTime.now(); // Get current local time

class UserHealthRecords extends StatefulWidget {
  const UserHealthRecords({super.key});

  @override
  State<UserHealthRecords> createState() => _UserHealthRecordsState();
}

class _UserHealthRecordsState extends State<UserHealthRecords> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        Row(
          children: [
            Container(
              color: Colors.white70,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.heart_circle,
                    ),
                    iconSize: 62,
                    color: logoColor,
                    tooltip: 'Heart Rate',
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'Heart Rate ',
                        style: TextStyle(
                          fontSize: 26,
                          color: logoColor,
                        ),
                        children: []),
                  )
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
