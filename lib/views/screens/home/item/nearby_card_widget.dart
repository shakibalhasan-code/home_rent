import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent_ird_foundation/core/models/home_model.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/transparent_widget.dart';

Widget buildNearbyPropertyCard(HomeModel homemodel) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: Container(
      width: 222,
      height: 272,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(homemodel.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [transparentColor, blackColor.withOpacity(0.8)])),
            ),
          ),
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
          Positioned(
            left: 15,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homemodel.homeName,
                  style: defaultTextStyle.copyWith(color: whiteColor),
                ),
                const SizedBox(height: 5),
                Text(
                  homemodel.homeOwner,
                  style: bodySmallText.copyWith(color: whiteColor),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
