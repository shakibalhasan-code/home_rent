import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_rent_ird_foundation/state/home/home_state.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/gradiunt_default_shape.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/my_icon_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _homeState = Get.find<HomeState>();
    return Scaffold(
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Location',
                            style: bodySmallText.copyWith(color: Colors.grey),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButton<String>(
                              value: _homeState.location.value,
                              elevation: 0,

                              underline: SizedBox(), // Remove default underline
                              icon: SvgPicture.asset(
                                icDownArrow,
                                height: 20,
                                width: 20,
                              ),
                              onChanged: (String? newValue) {
                                // Do something when the value changes
                                _homeState.location.value = newValue ?? 'Dhaka';
                              },
                              items: _homeState.locations
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: defaultTextStyle,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      MyIconWidget(svgIcon: icNotification, isTint: true)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIconColor: greyColor,
                                prefixIcon: SvgPicture.asset(
                                  icSearch,
                                  width: 20,
                                  height: 20,
                                ),
                                hintStyle:
                                    bodySmallText.copyWith(color: greyColor),
                                hintText: 'Search address, or near you'),
                          )),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                          flex: 1,
                          child: GradiuntDefaultShape(
                              child: SvgPicture.asset(
                                icFilter,
                                color: whiteColor,
                              ),
                              isSelected: true))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
