import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;
  const GlobalButton(
      {super.key,
      required this.child,
      required this.color,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
