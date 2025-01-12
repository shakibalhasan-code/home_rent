import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/route_manager.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';
import 'package:home_rent_ird_foundation/views/screens/home/home_screen.dart';

import 'views/screens/home/sections/drawer_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme_data(),
      home: Scaffold(
        backgroundColor: primaryColor,
        body: ZoomDrawer(
          angle: 0,
          mainScreenScale: 0.1,
          borderRadius: 40,
          menuScreen: MenuScreenPage(),
          mainScreen: HomeScreen(),
        ),
      ),
    );
  }
}
