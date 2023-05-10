import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/custom_menu_controller.dart';
import './drawer_list_tile.dart';

class SlideMenu extends StatelessWidget {
  const SlideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<CustomMenuController>();
    return Drawer(
      child: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              DrawerHeader(child: Image.asset("assets/images/logo.png")),
              DrawerListTile(
                onPress: () => menuController.setSelectedItem(MenuItems.home),
                isSelected: menuController.selectedItem.value == MenuItems.home,
                svgSrc: "assets/icons/menu_dashbord.svg",
                title: 'Home',
              ),
              DrawerListTile(
                onPress: () => menuController.setSelectedItem(MenuItems.route),
                isSelected:
                    menuController.selectedItem.value == MenuItems.route,
                svgSrc: "assets/icons/menu_tran.svg",
                title: 'Route',
              ),
              DrawerListTile(
                onPress: () =>
                    menuController.setSelectedItem(MenuItems.tracking),
                isSelected:
                    menuController.selectedItem.value == MenuItems.tracking,
                svgSrc: "assets/icons/menu_tran.svg",
                title: 'Tracking',
              ),
              DrawerListTile(
                onPress: () =>
                    menuController.setSelectedItem(MenuItems.message),
                isSelected:
                    menuController.selectedItem.value == MenuItems.message,
                svgSrc: "assets/icons/menu_task.svg",
                title: 'Message',
              ),
              DrawerListTile(
                onPress: () =>
                    menuController.setSelectedItem(MenuItems.profhile),
                isSelected:
                    menuController.selectedItem.value == MenuItems.profhile,
                svgSrc: "assets/icons/menu_store.svg",
                title: 'Profhile',
              ),
              DrawerListTile(
                onPress: () => menuController.setSelectedItem(MenuItems.login),
                isSelected:
                    menuController.selectedItem.value == MenuItems.login,
                svgSrc: "assets/icons/menu_profile.svg",
                title: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
