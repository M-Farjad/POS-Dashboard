import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/themes/custom_text_styles.dart';
import '../../../configs/themes/ui_parameters.dart';
import '../../../controllers/custom_menu_controller.dart';
import '../../../responsive.dart';
import './rotue_tile.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Messages
        CustomTitle(
          title: 'Message',
          height: Responsive.screenWidth(context) - 2 * defaultPadding,
          seeAll: () => Get.find<CustomMenuController>().selectedItem.value =
              MenuItems.message,
        ),
        kHalfHeightpace,
        Row(
          children: [
            ChatCircleTile(
              image: 'assets/images/logo.png',
            ),
            kHalfWidthSpace,
            ChatCircleTile(
              image: 'assets/images/chat1.png',
            ),
            kHalfWidthSpace,
            ChatCircleTile(
              image: 'assets/images/chat2.png',
            ),
          ],
        ),
        kHeightSpace,

        // tracking
        CustomTitle(
          title: 'Trackings',
          height: Responsive.screenWidth(context) - 2 * defaultPadding,
          seeAll: () => Get.find<CustomMenuController>().selectedItem.value =
              MenuItems.tracking,
        ),
        kHalfHeightpace,
        SizedBox(
          height: 400,
          child: ListView.separated(
            itemBuilder: (ctx, index) => RouteTile(
              type: 'M',
              name: '5',
              driver: 'Rana',
              bus: 'LEK-007',
              onTap: () async {},
            ),
            separatorBuilder: (ctx, index) => kHeightSpace,
            itemCount: 7,
          ),
        ),
        kHeightSpace,

        // routes
        CustomTitle(
          title: 'Routes',
          height: Responsive.screenWidth(context) - 2 * defaultPadding,
          seeAll: () => Get.find<CustomMenuController>().selectedItem.value =
              MenuItems.route,
        ),

        kHalfHeightpace,
        SizedBox(
          height: 400,
          child: ListView.separated(
            itemBuilder: (ctx, index) => RouteTile(
              type: 'M',
              name: '5',
              driver: 'Rana',
              bus: 'LEK-007',
              onTap: () async {},
              color: Colors.pink,
            ),
            separatorBuilder: (ctx, index) => kHeightSpace,
            itemCount: 7,
          ),
        ),
        kHeightSpace,
      ],
    );
  }
}

class ChatCircleTile extends StatelessWidget {
  const ChatCircleTile({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue,
          border: Border.all(
            color: Colors.blue,
            width: 2,
          )),
      child: Container(
        height: 60,
        width: 60,
        clipBehavior: Clip.hardEdge,
        // padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset(image),
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.height,
    required this.title,
    this.seeAll,
  });
  final double height;
  final String title;
  final Function()? seeAll;
  @override
  Widget build(BuildContext context) {
    if (seeAll == null || height < 100) {
      return Text(
        title,
        style: kTitleTextStyle,
      );
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: kTitleTextStyle,
            ),
            kWidthSpace,
            TextButton(onPressed: seeAll, child: const Text('see all')),
          ],
        ),
      );
    }
  }
}
