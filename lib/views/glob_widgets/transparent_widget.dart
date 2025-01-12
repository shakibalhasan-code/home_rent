import 'package:flutter/material.dart';

Container transparent_widget(Widget child) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.27),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: child,
      ));
}
