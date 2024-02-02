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
import 'package:provider/provider.dart';

import '../components/bigCard.dart';
import '../main.dart';

const BoxShadow myShadow = BoxShadow(
  blurRadius: 22.60,
  offset: Offset(0, 23),
  spreadRadius: 0,
);

// const Color myCardColor = Color(0xffFBFDFA); //soft white color

// Color logoColor = const Color(0xff3F3F69); //get the logo color
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
    ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //const Color.fromARGB(255, 245, 245, 245),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(children: [Icon(CupertinoIcons.app)]),
              ////////////////////////// carousel //////////////////////////
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Stack(children: [
                  const SizedBox(
                    child: Image(
                      image: AssetImage('assets/yatsi(logo).png'),
                      width: 200,
                    ),
                  ),
                  SizedBox(
                    height: width > height ? 300 : 250,
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
                        child: MyCarousel()),
                  ),
                ]),
              ),
              /////////////////////////////////////////////////////////////
              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onLongPress: () {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        },
                        child: const Icon(CupertinoIcons.slowmo)),
                    h2Text(
                      'Quick Services',
                      22,
                      FontWeight.bold,
                    ),
                    const Text('Access important services quickly',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.redAccent)),
                    Divider(
                      endIndent: 80,
                      indent: 80,
                      height: 1,
                      color: provider.mylogoColor.withOpacity(0.5),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconTextCard(
                            img: const AssetImage('assets/emergency.png'),
                            text: 'Emergency',
                            text2: 'Quick Response',
                            onTap: () {
                              // Add your code here for handling the Emergency card tap
                            },
                          ),
                          IconTextCard(
                            img: const AssetImage('assets/doctor.png'),
                            text: 'Consult',
                            text2: 'Symptom Checker',
                            onTap: () {
                              // Add your code here for handling the Consult card tap
                            },
                          ),
                          IconTextCard(
                            img: const AssetImage('assets/chatbot (1).png'),
                            text: 'ChatBot',
                            text2: 'Chat with Yiatsi Ai',
                            onTap: () {
                              // Add your code here for handling the ChatBot card tap
                            },
                          ),
                          IconTextCard(
                            img: const AssetImage('assets/tablets.png'),
                            text: 'Prescription',
                            text2: 'Check dosage',
                            onTap: () {
                              // Add your code here for handling the Prescription card tap
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    ///
                    ///////////////////SPECIALTIES////////////////////////////////
                    ///
                    ///
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            image: AssetImage('assets/specialties.png'),
                            width: 100,
                          ),
                          Text(
                            'Specialties',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Access Specific specialty',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.redAccent)),
                        ],
                      ),
                    ),
                    Divider(
                        endIndent: 80,
                        indent: 80,
                        height: 1,
                        color: provider.mylogoColor.withOpacity(0.5)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconTextCard(
                          img: const AssetImage('assets/advice.png'),
                          text: 'Heart',
                          text2: 'Cardiologists',
                          onTap: () {
                            // Add your code here for handling the Heart card tap
                          },
                        ),
                        IconTextCard(
                          img: const AssetImage('assets/chatbot (1).png'),
                          text: 'ChatBot',
                          text2: 'Chat with Yiatsi Ai',
                          onTap: () {
                            // Add your code here for handling the ChatBot card tap
                          },
                        ),
                        IconTextCard(
                          img: const AssetImage('assets/tablets.png'),
                          text: 'Prescription',
                          text2: 'Check dosage',
                          onTap: () {
                            // Add your code here for handling the Prescription card tap
                          },
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
          fontSize: 32,
          fontWeight: FontWeight.normal,
          color: const Color(0xff3F3F69)),
    );
  }
}

////////////////////////////////////////////////////////////////
///
///////////////////////////////////////////////////////////////

