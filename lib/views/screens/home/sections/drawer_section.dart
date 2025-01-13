import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_rent_ird_foundation/state/my_menu_controller.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';
import 'package:home_rent_ird_foundation/views/screens/home/item/drawer_item.dart';

class MenuScreenPage extends StatelessWidget {
  const MenuScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MyMenuController _menuController = Get.put(MyMenuController());

    return Container(
      color: Theme.of(context).primaryColor,
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_menuController.menuItems.length, (index) {
              final item = _menuController.menuItems[index];
              return index == 3 || index == 6
                  ? Column(
                      children: [
                        const Divider(color: Colors.white, thickness: 1),
                        DrawerItem(
                          isTint: item['isTint'],
                          icon: item['icon'],
                          label: item['label'],
                          isClicked:
                              _menuController.selectedIndex.value == index,
                          onTap: () => _menuController.selectItem(index),
                        ),
                      ],
                    )
                  : DrawerItem(
                      isTint: item['isTint'],
                      icon: item['icon'],
                      label: item['label'],
                      isClicked: _menuController.selectedIndex.value == index,
                      onTap: () => _menuController.selectItem(index),
                    );
            }),
          )),
    );
  }
}
