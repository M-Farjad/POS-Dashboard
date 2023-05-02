import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../main.dart';

class ProfileTileWidget extends StatelessWidget {
  final String title;
  final String busStopName;
  final String busRouteName;
  // final VoidCallback onTap;
  final _myRoutelist = [];
  ProfileTileWidget({
    super.key,
    required this.title,
    required this.busStopName,
    required this.busRouteName,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: mq.height * 0.01),
      child: Container(
        // padding: EdgeInsets.only(value),
        decoration: BoxDecoration(
            color: bodyColor, borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          // textColor: bodyColor,
          minVerticalPadding: mq.height * .01,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, color: bgColor),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(busRouteName),
              Text(busStopName),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.edit,
              color: bgColor,
              size: 24,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
