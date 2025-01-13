import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';

class AmenityInfo extends StatelessWidget {
  final String icon;
  final String text;

  const AmenityInfo({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            icon,
            color: whiteColor,
            width: 24,
            height: 24,
          ),
        ),
        SizedBox(width: 8),
        Text(text, style: bodySmallText.copyWith(color: Colors.white70)),
      ],
    );
  }
}
