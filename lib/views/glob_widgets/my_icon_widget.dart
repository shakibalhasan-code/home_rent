import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyIconWidget extends StatelessWidget {
  final String svgIcon;
  final bool? isTint;
  const MyIconWidget({super.key, required this.svgIcon, this.isTint});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SvgPicture.asset(
          svgIcon,
          height: 24,
          width: 24,
        ),
        if (isTint != null)
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
