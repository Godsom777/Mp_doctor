import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

const BoxShadow myShadow = BoxShadow(
  color: Color.fromARGB(31, 146, 139, 188),
  blurRadius: 18.60,
  offset: Offset(0, 20),
  spreadRadius: 0,
);

const Color myCardColor = Color(0xffFBFDFA); //soft white color
Color logoColor = const Color(0xff3F3F69); //get the logo color
DateTime now = DateTime.now(); // Get current local time

class IconContainerGrid extends StatelessWidget {
  // Sample data for containers
  final List<Map<String, dynamic>> containerData = [
    {'icon': LineAwesomeIcons.doctor, 'text': 'General Care'},
    {'icon': LineAwesomeIcons.nurse, 'text': 'Pharmacists'},
    {'icon': LineAwesomeIcons.baby, 'text': 'Pedetrician'},
    {'icon': LineAwesomeIcons.hospital, 'text': 'Primary Care'},
    {'icon': LineAwesomeIcons.teeth_open, 'text': 'Dentists'},
    {'icon': LineAwesomeIcons.people_carry, 'text': 'Family Health'},
    {'icon': LineAwesomeIcons.alternate_medical_chat, 'text': 'Chat'},
    {'icon': LineAwesomeIcons.glasses, 'text': 'Optician'},
    {'icon': LineAwesomeIcons.helping_hands, 'text': 'Dermatologist'},
    {'icon': LineAwesomeIcons.heart, 'text': 'Favorite'},
  ];

  IconContainerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: containerData.length,
      itemBuilder: (BuildContext context, int index) {
        // Generate a container dynamically based on the data
        return Container(
          decoration: const BoxDecoration(
              color: myCardColor,
              boxShadow: [myShadow],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  containerData[index]['icon'],
                  color: logoColor,
                ),
                h2Text(containerData[index]['text'], 14, FontWeight.normal)
              ],
            ),
          ),
        );
      },
    );
  }
}

Text h2Text(text, double size, FontWeight weight) {
  return Text(
    text,
    style: GoogleFonts.notoSansYi(fontSize: size, fontWeight: weight),
  );
}
