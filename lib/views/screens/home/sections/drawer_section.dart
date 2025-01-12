import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';
import 'package:home_rent_ird_foundation/views/screens/home/item/drawer_item.dart';

class MenuScreenPage extends StatefulWidget {
  const MenuScreenPage({Key? key}) : super(key: key);

  @override
  State<MenuScreenPage> createState() => _MenuScreenPageState();
}

class _MenuScreenPageState extends State<MenuScreenPage> {
  int selectedIndex = 0; // Track the selected item

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor, // Use primary color from theme
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerItem(
            icon: icHome,
            label: 'Home',
            isClicked: selectedIndex == 0,
            onTap: () => _onItemSelected(0),
          ),
          DrawerItem(
            icon: icProfile,
            label: 'Profile',
            isClicked: selectedIndex == 1,
            onTap: () => _onItemSelected(1),
          ),
          DrawerItem(
            icon: icLocation,
            label: 'Nearby',
            isClicked: selectedIndex == 2,
            onTap: () => _onItemSelected(2),
          ),
          const Divider(color: Colors.white, thickness: 1),
          DrawerItem(
            icon: icBookmarkSvg,
            label: 'Bookmark',
            isClicked: selectedIndex == 3,
            onTap: () => _onItemSelected(3),
          ),
          DrawerItem(
            icon: icNotification,
            label: 'Notification',
            isClicked: selectedIndex == 4,
            onTap: () => _onItemSelected(4),
          ),
          DrawerItem(
            icon: icMessage,
            label: 'Message',
            isClicked: selectedIndex == 5,
            onTap: () => _onItemSelected(5),
          ),
          const Divider(color: Colors.white, thickness: 1),
          DrawerItem(
            icon: icSettings,
            label: 'Setting',
            isClicked: selectedIndex == 6,
            onTap: () => _onItemSelected(6),
          ),
          DrawerItem(
            icon: icHelp,
            label: 'Help',
            isClicked: selectedIndex == 7,
            onTap: () => _onItemSelected(7),
          ),
          DrawerItem(
            icon: icLogout,
            label: 'Logout',
            isClicked: selectedIndex == 8,
            onTap: () => _onItemSelected(8),
          ),
        ],
      ),
    );
  }

  void _onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
