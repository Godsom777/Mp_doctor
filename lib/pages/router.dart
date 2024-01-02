import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mp_doctor/pages/ask_ai.dart';
import 'package:mp_doctor/pages/home.dart';
import 'package:mp_doctor/pages/appointments.dart';
import 'package:mp_doctor/pages/Profile.dart';

const Color myCardColor = Color(0xffFBFDFA);
Color logoColor = const Color(0xff3F3F69);

class MyRouter extends StatefulWidget {
  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: logoColor);
  static final List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Ask Ai',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
    Text(
      'Calendar',
      style: optionStyle,
    ),
  ];

  const MyRouter({super.key});

  @override
  State<MyRouter> createState() => _MyRouterState();
}

class _MyRouterState extends State<MyRouter> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    FindYourDoctorScreen(),
    Ask_Ai(),
    Profile(),
    Appointment(),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(color: myCardColor, boxShadow: [
              BoxShadow(
                blurRadius: 15,
                spreadRadius: -5,
                color: Color.fromRGBO(50, 50, 50, 0.2),
              )
            ]),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 7,
                  activeColor: logoColor,
                  iconSize: 26,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: logoColor,
                  tabs: [
                    GButton(
                      icon: CupertinoIcons.home,
                      text: 'Home',
                      iconColor: logoColor,
                    ),
                    GButton(
                      icon: CupertinoIcons.chat_bubble,
                      text: 'Ask Ai',
                      iconColor: logoColor,
                    ),
                    GButton(
                      icon: CupertinoIcons.person,
                      text: 'Your Profile',
                      iconColor: logoColor,
                    ),
                    GButton(
                      icon: CupertinoIcons.calendar_today,
                      text: 'Appointments',
                      iconColor: logoColor,
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            )),
        backgroundColor: const Color(0xFFEFF1EE),
        resizeToAvoidBottomInset: true,
        body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
////////////////////////////////////////////////////////////////
///
///////////////////////////////////////////////////////////////

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Book an appointment with Dr. Anthony Smith',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
