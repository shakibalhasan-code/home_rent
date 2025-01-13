import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_rent_ird_foundation/core/models/home_model.dart';
import 'package:home_rent_ird_foundation/state/details_screen_state/details_screen_state.dart';

import 'package:home_rent_ird_foundation/utils/app_style.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/glob_button.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/icon_transparent.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/my_icon_widget.dart';
import 'package:home_rent_ird_foundation/views/screens/details/widgets/amenity_info_widget.dart';

class DetailsScreen extends StatelessWidget {
  final HomeModel homeModel;
  const DetailsScreen({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    final _detailsState = Get.find<DetailsScreenState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Image Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(homeModel.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
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
                                  colors: [transparentColor, blackColor])),
                        ),
                      ),
                      // Back and Bookmark buttons
                      Positioned(
                        left: 16,
                        top: 48,
                        right: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Get.back(),
                              child: IconTransparent(
                                  borderRadius: 50,
                                  child: SvgPicture.asset(
                                    icBack,
                                    height: 24,
                                    width: 24,
                                    color: whiteColor,
                                  )),
                            ),
                            IconTransparent(
                                borderRadius: 50,
                                child: SvgPicture.asset(
                                  icBookmarkSvg,
                                  height: 24,
                                  width: 24,
                                  color: whiteColor,
                                )),
                          ],
                        ),
                      ),
                      // Property Info Overlay
                      Positioned(
                        left: 16,
                        bottom: 24,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              homeModel.homeName,
                              style:
                                  defaultTextStyle.copyWith(color: whiteColor),
                            ),
                            Text(homeModel.homeOwner,
                                style:
                                    bodySmallText.copyWith(color: greyColor)),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                AmenityInfo(
                                  icon: icBed,
                                  text:
                                      '${homeModel.totalBed.toString()} Bedroom',
                                ),
                                SizedBox(width: 24),
                                AmenityInfo(
                                  icon: icBath,
                                  text:
                                      '${homeModel.totalBath.toString()} Bathroom',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description Section
                      Padding(
                          padding: EdgeInsets.all(16),
                          child: Obx(() {
                            bool isExpanded =
                                _detailsState.isTextExpanded.value;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: isExpanded
                                        ? homeModel
                                            .description // Show full text if expanded
                                        : _detailsState.getTruncatedText(
                                            homeModel.description,
                                            100), // Limit to 100 characters (or any number)
                                    style: bodySmallText.copyWith(
                                        color: greyColor),
                                    children: [
                                      if (!isExpanded)
                                        TextSpan(
                                          text: ' See more',
                                          style: TextStyle(color: Colors.blue),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              _detailsState
                                                  .isTextExpanded.value = true;
                                            },
                                        ),
                                    ],
                                  ),
                                ),
                                if (isExpanded)
                                  TextButton(
                                    onPressed: () {
                                      _detailsState.isTextExpanded.value =
                                          false;
                                    },
                                    child: Text(
                                      'Show less',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                              ],
                            );
                          })),

                      // Owner Section
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(person1),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Garry Allen', style: defaultTextStyle),
                                Text('Owner',
                                    style: bodySmallText.copyWith(
                                        color: greyColor)),
                              ],
                            ),
                            Spacer(),
                            const GlobalButton(
                              color: Colors.blue,
                              radius: 12,
                              child: MyIconWidget(
                                iconColor: Colors.white,
                                svgIcon: icPhone,
                                isTint: false,
                              ),
                            ),
                            SizedBox(width: 12),
                            const GlobalButton(
                              color: Colors.blue,
                              radius: 12,
                              child: MyIconWidget(
                                iconColor: Colors.white,
                                svgIcon: icMessage,
                                isTint: false,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Gallery Section
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gallery', style: defaultTextStyle),
                            SizedBox(height: 16),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  5,
                                  (index) => Container(
                                    margin: EdgeInsets.only(right: 12),
                                    width: 72,
                                    height: 72,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/home_${index}.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Map Section
                      Container(
                        height: 200,
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover, image: AssetImage(map))),
                      ),

                      // Bottom Spacing for Price Section
                      SizedBox(height: 100),
                    ],
                  ),
                ))
              ],
            ),

            // Price Section (Fixed at bottom)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Price',
                          style: bodySmallText.copyWith(color: greyColor),
                        ),
                        Text(
                          'Rp. ${homeModel.priceYear} /Year',
                          style: defaultTextStyle,
                        ),
                      ],
                    ),
                    Spacer(),
                    GlobalButton(
                      radius: 15,
                      color: primaryColor.withOpacity(0.8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Rent Now',
                          style: defaultTextStyle.copyWith(
                              color: whiteColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
