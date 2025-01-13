import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_ird_foundation/state/home/home_state.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/my_icon_widget.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';
import 'package:home_rent_ird_foundation/views/screens/details/details_screen.dart';
import 'package:home_rent_ird_foundation/views/screens/home/item/nearby_card_widget.dart';
import 'package:home_rent_ird_foundation/views/screens/home/item/best_card.dart';

import 'widgets/tab_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _homeState = Get.find<HomeState>();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Static content with disabled scroll
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      MyIconWidget(
                          iconColor: blackColor,
                          svgIcon: icNotification,
                          isTint: true),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Search Bar
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: simpleGrey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey),
                              const SizedBox(width: 8),
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
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.tune, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Property Type Filter
                  Obx(() {
                    return Row(
                      children:
                          List.generate(_homeState.filterList.length, (index) {
                        return FilterChipWidget(
                          onTap: () {
                            print('filter ${_homeState.filterList[index]}');
                            _homeState.selectedTabIndex(index);
                          },
                          label: _homeState.filterList[index],
                          isSelected:
                              _homeState.filterTabSelectedIndex.value == index,
                        );
                      }),
                    );
                  }),
                  const SizedBox(height: 24),
                ],
              ),
            ),

            // Scrollable content (Nearby and Best for you)
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // Near from you section title
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
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
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 12)),

                  // Horizontal ListView for Nearby Properties
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _homeState.homes.length,
                        itemBuilder: (context, index) {
                          final house = _homeState.homes[index];
                          return NearbyPropertyCard(
                            homeModel: house,
                            onTap: () {
                              Get.to(DetailsScreen(homeModel: house));
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 16)),

                  // Static section for Best for you
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
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
                        ],
                      ),
                    ),
                  ),

                  // Vertical ListView for Best for you Properties
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final home = _homeState.homes[index];
                          return BestPropertyCard(
                              homeModel: home,
                              onTap: () {
                                Get.to(DetailsScreen(homeModel: home));
                              });
                        },
                        childCount: _homeState.homes.length,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
