import 'package:flutter/material.dart';

// import '../../../constants/constants.dart';
import '../../../configs/themes/app_color.dart';
import '../../../responsive.dart';

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
    void _showEditRouteTileDialog() {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: cardColorLight,
          title: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              // color: kLightPrimaryColor,
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  color: primaryColorDark,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                // APIs.updateMessage(widget.message, updatedMessage);
                Navigator.pop(context);
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 16,
                  color: primaryColorDark,
                ),
              ),
            )
          ],
          contentPadding: const EdgeInsets.only(top: 8, left: 10, right: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: Responsive.tabletSize * .35,
          ),
        ),
      );
    }

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10, vertical: Responsive.tabletSize * 0.01),
      child: Container(
        // padding: EdgeInsets.only(value),
        decoration: BoxDecoration(
            color: bgColorLight, borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          // textColor: bodyColor,
          // minVerticalPadding: mq.height * .01,
          minVerticalPadding: Responsive.tabletSize * .01,
          title: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: textColorLight),
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
                color: drawerColor,
                size: 24,
              ),
              onPressed: () => _showEditRouteTileDialog()),
        ),
      ),
    );
  }
}
