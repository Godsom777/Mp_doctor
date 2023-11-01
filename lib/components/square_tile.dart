import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onPressed; // Add an onPressed callback for handling taps

  const SquareTile({super.key, required this.imagePath, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) {
            onPressed!(); // Trigger the onPressed callback if it's provided
          }
        },
        child: Container(
          width: 30, // Set the width and height as per your requirements
          height: 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
