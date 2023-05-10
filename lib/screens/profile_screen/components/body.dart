import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../configs/themes/app_color.dart';
import '../../../responsive.dart';
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

    final _myRoutelist = [];

    return SafeArea(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //for adding some space
              SizedBox(
                  width: Responsive.tabletSize,
                  height: Responsive.tabletSize * 0.03),
              CustomTextField(
                title: 'Name',
                hintText: 'e.g Salman Naeem',
                iconData: Icons.person_2_outlined,
                controller: _nameController,
              ),
              SizedBox(height: Responsive.tabletSize * 0.02),
              CustomTextField(
                hintText: 'e.g abc@example.com',
                title: 'Email',
                iconData: Icons.email_outlined,
                controller: _emailController,
              ),
              SizedBox(height: Responsive.tabletSize * 0.02),
              const Divider(
                  color: secondaryColorLight,
                  height: 5,
                  indent: 200,
                  endIndent: 200),
              SizedBox(height: Responsive.tabletSize * 0.01),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Notification',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: textColorLight),
                ),
              ),
              CustomTextSwitch(flag: msgFlag, name: 'Message'),
              CustomTextSwitch(flag: mrngFlag, name: 'Morning Route'),
              CustomTextSwitch(flag: eveFlag, name: 'Evening Route'),
              CustomTextSwitch(flag: spcialFlag, name: 'Special Route'),
              const Divider(
                  color: secondaryColorLight,
                  height: 5,
                  indent: 200,
                  endIndent: 200),
              SizedBox(height: Responsive.tabletSize * 0.01),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'My Route',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: Responsive.tabletSize * 0.01),
              SizedBox(
                height: Responsive.tabletSize * .35,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: ProfileTileWidget(
                          title: 'Morning',
                          busStopName: 'Bus Stop 1',
                          busRouteName: 'Route 1',
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
