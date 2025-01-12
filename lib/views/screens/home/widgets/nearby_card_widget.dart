import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent_ird_foundation/core/models/home_model.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/transparent_widget.dart';

Widget buildNearbyPropertyCard(HomeModel homemodel) {
  return Padding(
    padding: const EdgeInsets.only(left: 5.0),
    child: Container(
      width: 280,
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(homemodel.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            right: 16,
            child: transparent_widget(Row(
              children: [
                SvgPicture.asset(
                  icLocation,
                  width: 18,
                  height: 18,
                  color: whiteColor,
                ),
                const SizedBox(width: 5),
                Text(
                  '${homemodel.km} km',
                  style: bodySmallText.copyWith(color: whiteColor),
                )
              ],
            )),
          ),
        ],
      ),
    ),
  );
}
