import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mp_doctor/pages/router.dart';

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

class Slide2 extends StatelessWidget {
  const Slide2({super.key});

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Container(
      width: width - 20,
      height: 200,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage('assets/yatsi(logo).png'),
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomRight,
            opacity: 0.04),
        color: logoColor,
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
      child: const Column(
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
