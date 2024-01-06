import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mp_doctor/pages/router.dart';

const BoxShadow myShadow = BoxShadow(
  color: Color(0x21A4A1B5),
  blurRadius: 22.60,
  offset: Offset(0, 23),
  spreadRadius: 0,
);

LinearGradient dualGradient = LinearGradient(
    colors: [logoColor, Colors.red],
    stops: const [10, 20],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

class Slide1 extends StatelessWidget {
  const Slide1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width - 50,
      height: 200,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('assets/yatsi(logo).png'),
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomRight,
            opacity: 0.04),
        color: myCardColor.withOpacity(.5),
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
                          color: const Color.fromARGB(255, 5, 18, 43)),
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
                            TextSpan(text: "to access all the features")
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Slide2 extends StatefulWidget {
  const Slide2({super.key});

  @override
  State<Slide2> createState() => _Slide2State();
}

class _Slide2State extends State<Slide2> {
  bool isEyeClosed = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width - 20,
      height: 200,
      decoration: BoxDecoration(
        gradient: dualGradient,
        color: logoColor.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InkWell(
                    onTap: () {
                      //Todo: Takes to the Profile page
                    },
                    child: Column(
                      children: [
                        h2Text('Okoro\'s Stats  >', 20, FontWeight.w500),
                        Divider(
                          endIndent: 80,
                          indent: 80,
                          height: 1,
                          color: Colors.white.withOpacity(0.25),
                        ),
                        h2Text(' Your easy quick stats', 12, FontWeight.normal),
                      ],
                    )),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconWithText(
                    img: AssetImage('assets/blood-pressure.png'),
                    text: '120mmHg',
                    text2: 'Blood Pressure',
                  ),
                  IconWithText(
                    img: AssetImage('assets/gene.png'),
                    text: 'AA',
                    text2: 'Geno Type',
                  ),
                  IconWithText(
                    img: AssetImage('assets/blood.png'),
                    text: 'O Positive',
                    text2: 'Blood Group',
                  ),
                  IconWithText(
                    img: AssetImage('assets/heart.png'),
                    text: '80 Bpm',
                    text2: 'Heart Rate',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: h2Text('Allergies   >', 16, FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final ImageProvider img;
  final String text;
  final String text2;
  const IconWithText({
    required this.img,
    required this.text,
    required this.text2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [myShadow]),
      child: Column(
        children: [
          Image(
            image: img,
            width: 50,
          ),
          h2Text(text, 18, FontWeight.bold),
          h2Text(text2, 12, FontWeight.normal)
        ],
      ),
    );
  }
}

Text h2Text(text, double size, FontWeight weight) {
  return Text(
    text,
    style: GoogleFonts.koHo(
        fontSize: size,
        fontWeight: weight,
        color: const Color.fromARGB(255, 235, 239, 243)),
  );
}
