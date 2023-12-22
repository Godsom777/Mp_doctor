import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

const Color myCardColor = Color(0xffFBFDFA); //soft white color
Color logoColor = const Color(0xff3F3F69); //get the logo color
DateTime now = DateTime.now(); // Get current local time

// time using DateFormat
String formattedTime = DateFormat('hh:mm a').format(now);

//  date using DateFormat
String formattedDate = DateFormat('EE, MMM d, yy').format(now);

class FindYourDoctorScreen extends StatefulWidget {
  const FindYourDoctorScreen({super.key});

  @override
  State<FindYourDoctorScreen> createState() => _FindYourDoctorScreenState();
}

class _FindYourDoctorScreenState extends State<FindYourDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEFF1EE),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 30.0,
                  left: 30.0,
                  top: 50,
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headerText('Welcome'),
                    Column(
                      children: [
                        const Icon(CupertinoIcons.calendar_circle),
                        Text('Today is $formattedDate'),
                      ],
                    ),

                    //  Image( image: AssetImage('assets/yatsi(logo).png'),width: 120,),
                  ],
                ),
              ),
              ////////////////////////// the first card//////////////////////////
              Container(
                width: width - 20,
                height: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/yatsi(logo).png'),
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.bottomRight,
                      opacity: 0.04),
                  color: myCardColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.04),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/yatsi(logo).png'),
                          width: 120,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chisom E.O.',
                                style: GoogleFonts.notoSansYi(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w900,
                                    color: logoColor),
                              ),
                              Text(
                                'Member Since 2023',
                                style: GoogleFonts.notoSansYi(
                                    fontSize: 12,
                                    color:
                                        const Color.fromARGB(255, 5, 18, 43)),
                              ),
                              Text.rich(
                                TextSpan(
                                    text: 'Go ',
                                    style: GoogleFonts.notoSansYi(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: logoColor),
                                    children: const [
                                      TextSpan(
                                          text: "Premium ",
                                          style: TextStyle(color: Colors.red)),
                                      TextSpan(
                                          text: "to access all the features")
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 0.3,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    h2Text(
                      'Ask Yiatsi Any Health Related Question',
                      20,
                    ),
                  ],
                ),
              ),

              // Search bar
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.send),
                          hintText: 'Start typing',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              /////////////////////////////////////////////////
              // Doctors near you
              Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sample Questions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return h2Text(
                          'What are the synthoms of',
                          18,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text h2Text(text, size) {
    return Text(
      text,
      style: GoogleFonts.notoSansYi(fontSize: 20, fontWeight: FontWeight.w400),
    );
  }

  Text headerText(text) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          fontSize: 32, fontWeight: FontWeight.bold, color: logoColor),
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
