import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mp_doctor/components/my_card.dart';

import '../components/myIcons.dart';

const BoxShadow myShadow = BoxShadow(
  color: Color.fromARGB(31, 146, 139, 188),
  blurRadius: 18.60,
  offset: Offset(0, 20),
  spreadRadius: 0,
);

const Color myCardColor = Color(0xffFBFDFA); //soft white color
Color logoColor = const Color(0xff3F3F69); //get the logo color
DateTime now = DateTime.now(); // Get current local time
String formattedTime = DateFormat('hh:mm a').format(now);
Color myBgColor = const Color(0xFFEFF1EE);

//  date using DateFormat
String formattedDate = DateFormat('EE, MMM d, yy').format(now);

class Ask_Ai extends StatelessWidget {
  const Ask_Ai({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: myBgColor,
          body: Center(
              child: SizedBox(
                  height: height,
                  width: width - 100,
                  child: Column(children: [
                    Container(
                      height: height / 10,
                      width: 250,
                      decoration: const BoxDecoration(
                          boxShadow: [myShadow],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Center(
                          child: h2Text(
                              'Ask Yiatsi', 20, FontWeight.bold, logoColor)),
                    ),
                    const SizedBox(height: 100),
                    h2Text('Let Yiatsi answer your medical questions', 24,
                        FontWeight.bold, logoColor),
                    const SizedBox(height: 20),
                    h2Text(
                        'Ask relevant medical questions the Ai will try to answer as accurately as it is trained',
                        14,
                        FontWeight.normal,
                        logoColor),
                    const SizedBox(height: 20),
                    myIcon(
                      icon: CupertinoIcons.chat_bubble_text,
                      size: 36,
                      color: logoColor,
                    ),
                    const SizedBox(height: 20),
                    h2Text(
                        'Please be cautious that the ai is not, and can not replace an actual medical personnel please seek medical advice form relevent medical personnel in case of life threatening situations',
                        14,
                        FontWeight.normal,
                        Colors.red),
                  ])))),
    );
  }
}

Text h2Text(String text, double size, FontWeight weight, Color logoColor) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style:
        GoogleFonts.koHo(fontSize: size, fontWeight: weight, color: logoColor),
  );
}
