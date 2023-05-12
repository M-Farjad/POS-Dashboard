import 'package:flutter/material.dart';

// import '../../main.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/header.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static String routeName = '/';
  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size;
    return const SafeArea(
      child: SingleChildScrollView(
        padding: defaultEdgePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(title: 'Profile'),
            kHeightSpace,
            Body(),
          ],
        ),
      ),
    );
  }
}
