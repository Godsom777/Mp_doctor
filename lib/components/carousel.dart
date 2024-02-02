import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mp_doctor/components/bigCard.dart';

class MyCarousel extends StatelessWidget {
  final List<Widget> cards = [const Slide1(), const Slide2()];

  MyCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        height: width > height ? 350 : 200,
        enlargeCenterPage: true,
        autoPlay: false,
        autoPlayCurve: Curves.decelerate,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 600),
        viewportFraction: 0.95,
      ),
      items: cards,
    );
  }
}
