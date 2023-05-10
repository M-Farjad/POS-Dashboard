import 'package:flutter/material.dart';

import '../../responsive.dart';

import 'package:get/get.dart';

import '../../controllers/custom_menu_controller.dart';

import '../dLogin/d_tracking_screen.dart';
import '../home/home_screen.dart';
import '../message/message_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../route/route_screen.dart';
import '../tracking/tracking_screen.dart';
import './compoenents/slide_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<CustomMenuController>();
    return Scaffold(
      key: menuController.scaffoldKey,
      drawer: const SlideMenu(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              child: SlideMenu(),
            ),
          Obx(
            () => Expanded(
              flex: 5,
              child: showMenuScreen(menuController.selectedItem.value),
            ),
          ),
        ],
      ),
    );
  }

  Widget showMenuScreen(MenuItems menuItem) {
    if (menuItem == MenuItems.home) {
      return const HomeScreen();
    } else if (menuItem == MenuItems.route) {
      return const RouteScreen();
    } else if (menuItem == MenuItems.tracking) {
      return const TrackingScreen();
    } else if (menuItem == MenuItems.message) {
      return const MessageScreen();
    } else if (menuItem == MenuItems.profhile) {
      return const ProfileScreen();
    } else if (menuItem == MenuItems.login) {
      return const DLoginScreen();
    } else {
      return const SizedBox.shrink();
    }
  }
}
