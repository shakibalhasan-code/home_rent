import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_rent_ird_foundation/core/models/home_model.dart';
import 'package:home_rent_ird_foundation/state/home/home_state.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/gradiunt_default_shape.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/my_icon_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_ird_foundation/views/screens/home/widgets/best_card.dart';
import 'package:home_rent_ird_foundation/views/screens/home/widgets/nearby_card_widget.dart';
import 'package:home_rent_ird_foundation/views/screens/home/widgets/tab_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _homeState = Get.find<HomeState>();

    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: bodySmallText.copyWith(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            Text(
                              'Jakarta',
                              style: defaultTextStyle,
                            ),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ],
                    ),
                    MyIconWidget(svgIcon: icNotification, isTint: true)
                  ],
                ),
                SizedBox(height: 20),

                // Search Bar
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: simpleGrey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search address, or near you',
                                  border: InputBorder.none,
                                  hintStyle: bodySmallText.copyWith(
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.tune, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Property Type Filter
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildFilterChip('House', true),
                      buildFilterChip('Apartment', false),
                      buildFilterChip('Hotel', false),
                      buildFilterChip('Villa', false),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // Near from you section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Near from you',
                      style: defaultTextStyle,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See more',
                        style: bodySmallText.copyWith(color: greyColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final house = _homeState.homes[index];
                        return buildNearbyPropertyCard(house);
                      }),
                ),
                SizedBox(height: 24),

                // Best for you section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best for you',
                      style: defaultTextStyle,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See more',
                        style: bodySmallText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
