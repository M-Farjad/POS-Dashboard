import 'package:get/get.dart';

import '../controllers/custom_menu_controller.dart';

import '../screens/login/login_screen.dart';
import '../screens/main/main_screen.dart';
import '../screens/profile_screen/profile_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
        GetPage(
            name: MainScreen.routeName,
            page: () => const MainScreen(),
            binding: BindingsBuilder(() {
              Get.put(CustomMenuController());
            })),
        GetPage(
            name: ProfileScreen.routeName,
            page: () => const ProfileScreen(),
            binding: BindingsBuilder(() {
              Get.put(CustomMenuController());
            })),
      ];
}
