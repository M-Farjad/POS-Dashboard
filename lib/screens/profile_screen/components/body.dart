import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:yums_dashboard/constants/constants.dart';

import '../../../main.dart';
import 'custom_text_switch.dart';
import 'custom_textfields.dart';
import 'profile_route_tile.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    bool msgFlag = true;
    bool mrngFlag = false;
    bool eveFlag = true;
    bool spcialFlag = false;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //for adding some space
            SizedBox(width: mq.width, height: mq.height * 0.03),
            CustomTextField(
              title: 'Name',
              hintText: 'e.g Salman Naeem',
              iconData: CupertinoIcons.person,
              controller: _nameController,
            ),
            SizedBox(height: mq.height * 0.02),
            CustomTextField(
              hintText: 'e.g abc@example.com',
              title: 'Email',
              iconData: Icons.email_outlined,
              controller: _emailController,
            ),
            SizedBox(height: mq.height * 0.02),
            const Divider(
                color: secondaryColor, height: 5, indent: 200, endIndent: 200),
            SizedBox(height: mq.height * 0.01),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Notification',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
            CustomTextSwitch(flag: msgFlag, name: 'Message'),
            CustomTextSwitch(flag: mrngFlag, name: 'Morning Route'),
            CustomTextSwitch(flag: eveFlag, name: 'Evening Route'),
            CustomTextSwitch(flag: spcialFlag, name: 'Special Route'),
            const Divider(
                color: secondaryColor, height: 5, indent: 200, endIndent: 200),
            SizedBox(height: mq.height * 0.01),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'My Route',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: mq.height * 0.01),
            ProfileTileWidget(
              title: 'Morning',
              busStopName: 'Bus Stop 1',
              busRouteName: 'Route 1',
            ),
            ProfileTileWidget(
              title: 'Evening',
              busStopName: 'Bus Stop 1',
              busRouteName: 'Route 1',
            ),
            ProfileTileWidget(
              title: 'Special',
              busStopName: 'Bus Stop 1',
              busRouteName: 'Route 1',
            ),
          ],
        ),
      ),
    );
  }
}
