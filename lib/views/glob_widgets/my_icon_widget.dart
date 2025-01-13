import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyIconWidget extends StatelessWidget {
  final String svgIcon;
  final bool? isTint;
  final Color iconColor;
  const MyIconWidget(
      {super.key, required this.svgIcon, this.isTint, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SvgPicture.asset(
          svgIcon,
          height: 24,
          width: 24,
          color: iconColor,
        ),
        if (isTint == true)
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
