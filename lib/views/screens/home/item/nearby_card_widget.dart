import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_rent_ird_foundation/core/models/home_model.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/transparent_widget.dart';

class NearbyPropertyCard extends StatelessWidget {
  final HomeModel homeModel;
  final VoidCallback onTap;

  const NearbyPropertyCard({
    Key? key,
    required this.homeModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          width: 222,
          height: 272,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(homeModel.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Gradient overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [transparentColor, blackColor.withOpacity(0.8)],
                    ),
                  ),
                ),
              ),
              // Distance indicator at the top-right
              Positioned(
                top: 16,
                right: 16,
                child: TransparentWidget(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        icLocation,
                        width: 18,
                        height: 18,
                        color: whiteColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${homeModel.km} km',
                        style: bodySmallText.copyWith(color: whiteColor),
                      ),
                    ],
                  ),
                ),
              ),
              // Property name and owner at the bottom-left
              Positioned(
                left: 15,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeModel.homeName,
                      style: defaultTextStyle.copyWith(color: whiteColor),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      homeModel.homeOwner,
                      style: bodySmallText.copyWith(color: whiteColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
