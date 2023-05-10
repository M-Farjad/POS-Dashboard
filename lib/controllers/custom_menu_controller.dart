import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MenuItems {
  login,
  logout,
  profhile,
  home,
  route,
  tracking,
  message,
}

class CustomMenuController extends GetxController {
  final selectedItem = MenuItems.home.obs;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void setSelectedItem(MenuItems item) {
    selectedItem.value = item;
  }
}
