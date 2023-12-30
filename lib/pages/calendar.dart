import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color myCardColor = Color(0xffFBFDFA); //soft white color
Color logoColor = const Color(0xff3F3F69); //get the logo color
DateTime now = DateTime.now(); // Get current local time
String formattedTime = DateFormat('hh:mm a').format(now);

//  date using DateFormat
String formattedDate = DateFormat('EE, MMM d, yy').format(now);

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Header'),
              Column(
                children: [
                  
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
