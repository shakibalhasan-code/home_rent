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
    final HomeState homeState = Get.find<HomeState>();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(homeState),
            Expanded(child: _buildScrollableContent(homeState))
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(HomeState homeState) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLocationHeader(),
          const SizedBox(height: 20),
          _buildSearchBar(),
          const SizedBox(height: 20),
          _buildPropertyTypeFilter(homeState),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildLocationHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location', style: bodySmallText.copyWith(color: Colors.grey)),
            Row(
              children: [
                Text('Jakarta', style: defaultTextStyle),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
        MyIconWidget(
          iconColor: blackColor,
          svgIcon: icNotification,
          isTint: true,
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
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
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search address, or near you',
                      border: InputBorder.none,
                      hintStyle: bodySmallText.copyWith(color: Colors.grey),
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
    );
  }

  Widget _buildPropertyTypeFilter(HomeState homeState) {
    return Obx(() {
      return Row(
        children: List.generate(homeState.filterList.length, (index) {
          return FilterChipWidget(
            onTap: () => homeState.selectedTabIndex(index),
            label: homeState.filterList[index],
            isSelected: homeState.filterTabSelectedIndex.value == index,
          );
        }),
      );
    });
  }

  Widget _buildScrollableContent(HomeState homeState) {
    return CustomScrollView(
      slivers: [
        _buildSectionTitle('Near from you', onSeeMore: () {}),
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        _buildNearbyProperties(homeState),
        const SliverPadding(padding: EdgeInsets.only(top: 16)),
        _buildSectionTitle('Best for you', onSeeMore: () {}),
        _buildBestProperties(homeState),
      ],
    );
  }

  Widget _buildSectionTitle(String title, {required VoidCallback onSeeMore}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: defaultTextStyle),
            TextButton(
              onPressed: onSeeMore,
              child: Text('See more',
                  style: bodySmallText.copyWith(color: greyColor)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearbyProperties(HomeState homeState) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 280,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeState.homes.length,
          itemBuilder: (context, index) {
            final house = homeState.homes[index];
            return NearbyPropertyCard(
              homeModel: house,
              onTap: () => Get.to(DetailsScreen(homeModel: house)),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBestProperties(HomeState homeState) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final home = homeState.homes[index];
            return BestPropertyCard(
              homeModel: home,
              onTap: () => Get.to(DetailsScreen(homeModel: home)),
            );
          },
          childCount: homeState.homes.length,
        ),
      ),
    );
  }
}
