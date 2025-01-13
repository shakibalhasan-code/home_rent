import 'package:get/get.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';

class MyMenuController extends GetxController {
  // Observable selected index
  var selectedIndex = 0.obs;

  // Method to update selected index
  void selectItem(int index) {
    selectedIndex.value = index;
  }

  final List<Map<String, dynamic>> menuItems = [
    {'icon': icHome, 'label': 'Home'},
    {'icon': icProfile, 'label': 'Profile'},
    {'icon': icLocation, 'label': 'Nearby'},
    {'icon': icBookmarkSvg, 'label': 'Bookmark'},
    {'icon': icNotification, 'label': 'Notification', 'isTint': true},
    {'icon': icMessage, 'label': 'Message', 'isTint': true},
    {'icon': icSettings, 'label': 'Setting'},
    {'icon': icHelp, 'label': 'Help'},
    {'icon': icLogout, 'label': 'Logout'},
  ];
}
