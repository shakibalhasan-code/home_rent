import 'package:flutter/material.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';

class IconTransparent extends StatelessWidget {
  final double borderRadius;
  final Widget child;
  const IconTransparent(
      {super.key, required this.borderRadius, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.black.withOpacity(0.27)),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}
