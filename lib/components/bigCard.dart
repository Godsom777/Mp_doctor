import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mp_doctor/components/my_button.dart';
import 'package:mp_doctor/main.dart';
import 'package:mp_doctor/pages/router.dart';
import 'package:provider/provider.dart';

const BoxShadow myShadow = BoxShadow(
  blurRadius: 22.60,
  offset: Offset(0, 23),
  spreadRadius: 0,
);

LinearGradient dualGradient = const LinearGradient(
    colors: [Color(0xff3F3F69), Color.fromARGB(255, 128, 142, 177)],
    stops: [0.15, 0.95],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft);

class Slide1 extends StatelessWidget {
  const Slide1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: width > height ? 250 : 200,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(provider.mylogoImage),
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomRight,
            opacity: 0.04),
        color: provider.cardColor.withOpacity(.5),
        boxShadow: [
          BoxShadow(
            color: provider.shadowColor,
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(provider.mylogoImage),
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
                          color: provider.mylogoColor),
                    ),
                    Text(
                      'Member Since 2023',
                      style: GoogleFonts.notoSansYi(
                          fontSize: 12, color: provider.mylogoColor),
                    ),
                    Text.rich(
                      TextSpan(
                          text: 'Go ',
                          style: GoogleFonts.notoSansYi(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: provider.mylogoColor),
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
    ThemeProvider provider = Provider.of(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: 200,
      decoration: BoxDecoration(
        gradient: dualGradient,
        color: const Color(0xff3F3F69).withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            color: provider.shadowColor,
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                        h2Text('Aluka\'s Stats  >', 20, FontWeight.bold),
                        Divider(
                          endIndent: 80,
                          indent: 80,
                          height: 1,
                          color: Colors.white.withOpacity(0.25),
                        ),
                        h2Text('Last Update: 2 days ago', 12, FontWeight.w500)
                      ],
                    )),
              ),
              const Flex(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                direction: Axis.horizontal,
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
              Column(
                children: [
                  MyButton(
                    onTap: () {},
                    text: "Update >",
                  ),

                  // h2Text('Update >', 16, FontWeight.w500),
                ],
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
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(.25), width: .8),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      // decoration: const BoxDecoration(
      //   boxShadow: [myShadow]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image(
              image: img,
              width: 35,
            ),
            h2Text(text, 16, FontWeight.bold),
            h2Text(text2, 12, FontWeight.normal)
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////

Text h2Text(text, double size, FontWeight weight) {
  return Text(
    text,
    style: GoogleFonts.koHo(
        fontSize: size,
        fontWeight: weight,
        color: const Color.fromARGB(255, 235, 239, 243)),
  );
}
