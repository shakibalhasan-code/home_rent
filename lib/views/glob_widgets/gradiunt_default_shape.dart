import 'package:flutter/material.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';

class GradiuntDefaultShape extends StatelessWidget {
  final bool isSelected;
  final Widget child;

  const GradiuntDefaultShape(
      {super.key, required this.child, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? primaryColor
            : null, // Use a solid color for the button
        borderRadius: BorderRadius.circular(10), // Adjust border radius
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffA0DAFB), Color(0xff0A8ED9)],
        ),
      ),
    );
  }
}
