import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mp_doctor/components/bigCard.dart';

class MyCarousel extends StatelessWidget {
  final List<Widget> cards = [const Slide1(), const Slide2()];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: false,
        autoPlay: false,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.decelerate,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 600),
        viewportFraction: 0.9,
      ),
      items: cards,
    );
  }
}
