import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:mp_doctor/components/carousel.dart';
import 'package:mp_doctor/components/iconTextCard.dart';
import 'package:mp_doctor/components/my_card.dart';
import 'package:mp_doctor/components/user_health_records.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/bigCard.dart';

const BoxShadow myShadow = BoxShadow(
  color: Color(0x21A4A1B5),
  blurRadius: 22.60,
  offset: Offset(0, 23),
  spreadRadius: 0,
);

const Color myCardColor = Color(0xffFBFDFA); //soft white color
Color logoColor = const Color(0xff3F3F69); //get the logo color
DateTime now = DateTime.now(); // Get current local time

// TODO: get the _current user's name

// time using DateFormat
String formattedTime = DateFormat('hh:mm a').format(now);

//  date using DateFormat
String formattedDate = DateFormat('EE, MMM d').format(now);

class FindYourDoctorScreen extends StatefulWidget {
  const FindYourDoctorScreen({super.key});

  @override
  State<FindYourDoctorScreen> createState() => _FindYourDoctorScreenState();
}

class _FindYourDoctorScreenState extends State<FindYourDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ////////////////////////// carousel //////////////////////////
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Stack(children: [
                  Image(
                    image: AssetImage('assets/yatsi(logo).png'),
                    width: 200,
                  ),
                  BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
                      child: SizedBox(height: height / 3, child: MyCarousel())),
                ]),
              ),
              /////////////////////////////////////////////////////////////
              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(CupertinoIcons.slowmo),
                    h2Text(
                      'Quick Services',
                      22,
                      FontWeight.bold,
                    ),
                    h2Text('Access important services quickly', 14,
                        FontWeight.normal),
                    Divider(
                      endIndent: 80,
                      indent: 80,
                      height: 1,
                      color: logoColor.withOpacity(0.25),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTextCard(
                          img: AssetImage('assets/emergency.png'),
                          text: 'Emergency',
                          text2: 'Quick Response',
                        ),
                        IconTextCard(
                          img: AssetImage('assets/doctor.png'),
                          text: 'Consult',
                          text2: 'Symptom Checker',
                        ),
                        IconTextCard(
                          img: AssetImage('assets/health.png'),
                          text: 'Heart',
                          text2: 'Heart Rate Dictector',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTextCard(
                          img: AssetImage('assets/advice.png'),
                          text: 'Seek Advice',
                          text2: 'General Tips',
                        ),
                        IconTextCard(
                          img: AssetImage('assets/chatbot (1).png'),
                          text: 'ChatBot',
                          text2: 'Chat with Yiatsi Ai',
                        ),
                        IconTextCard(
                          img: AssetImage('assets/tablets.png'),
                          text: 'Prescription',
                          text2: 'Check dosage',
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(CupertinoIcons.arrow_down_right_arrow_up_left),
                          h2Text(
                            'Specialties',
                            22,
                            FontWeight.bold,
                          ),
                          h2Text('Access specific specialty', 14,
                              FontWeight.normal),
                        ],
                      ),
                    ),
                    Divider(
                      endIndent: 80,
                      indent: 80,
                      height: 1,
                      color: logoColor.withOpacity(0.25),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTextCard(
                          img: AssetImage('assets/advice.png'),
                          text: 'Seek Advice',
                          text2: 'General Tips',
                        ),
                        IconTextCard(
                          img: AssetImage('assets/chatbot (1).png'),
                          text: 'ChatBot',
                          text2: 'Chat with Yiatsi Ai',
                        ),
                        IconTextCard(
                          img: AssetImage('assets/tablets.png'),
                          text: 'Prescription',
                          text2: 'Check dosage',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text h2Text(text, double size, FontWeight weight) {
    return Text(
      text,
      style: GoogleFonts.koHo(fontSize: size, fontWeight: weight),
    );
  }

  Text headerText(text) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
          fontSize: 32, fontWeight: FontWeight.normal, color: logoColor),
    );
  }
}

////////////////////////////////////////////////////////////////
///
///////////////////////////////////////////////////////////////
