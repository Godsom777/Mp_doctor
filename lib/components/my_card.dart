import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mp_doctor/main.dart';
import 'package:provider/provider.dart';

const BoxShadow myShadow = BoxShadow(
  color: Color.fromARGB(31, 146, 139, 188),
  blurRadius: 18.60,
  offset: Offset(0, 20),
  spreadRadius: 0,
);

//get the logo color
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
    ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: false);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),

      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 3,
      //   crossAxisSpacing: 8.0,
      //   mainAxisSpacing: 8.0,
      // ),
      itemCount: containerData.length,
      itemBuilder: (BuildContext context, int index) {
        // Generate a container dynamically based on the data
        return Container(
          decoration: BoxDecoration(
              color: provider.cardColor,
              boxShadow: [myShadow],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  containerData[index]['icon'],
                  color: provider.mylogoColor,
                ),
                h2Text(containerData[index]['text'], 14, FontWeight.normal,
                    color: provider.mylogoColor)
              ],
            ),
          ),
        );
      },
    );
  }
}

Text h2Text(text, double size, FontWeight weight, {required color}) {
  return Text(
    text,
    style: GoogleFonts.koHo(fontSize: size, fontWeight: weight),
  );
}
