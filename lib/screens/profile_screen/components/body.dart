import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../configs/themes/app_color.dart';
import '../../../responsive.dart';
import 'custom_text_switch.dart';
import 'custom_textfields.dart';
import 'profile_route_tile.dart';
import 'text_field_model.dart';

/// The class "Body" is a stateful widget in Dart.
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  List<String> dataList = [];
  static const String userKey = 'userData';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserdata();
  }

  @override
  Widget build(BuildContext context) {
    /// These are boolean variables that are used to control the state of custom text switches in the
    /// UI. They determine whether the switches are turned on or off. For example, `msgFlag` controls
    /// the state of the "Message" switch, and if it is set to `true`, the switch will be turned on.
    bool msgFlag = true;
    bool mrngFlag = false;
    bool eveFlag = true;
    bool spcialFlag = false;

    final _myRoutelist = [];
    // Box<TextFieldModel> myBox = Hive.openBox<TextFieldModel>('textFieldsBox');
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
              MaterialButton(
                /// This code block is defining an asynchronous function that is triggered when a button
                /// is pressed. The function retrieves an instance of SharedPreferences and sets a
                /// string list with the key `userKey` and the values of
                /// `_nameController.text.toString()` and `_emailController.text.toString()`. This
                /// allows the user's name and email to be stored in shared preferences for future use.
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setStringList(
                    userKey,
                    [_nameController.text, _emailController.text],
                  );
                },
                child: const Icon(Icons.add),
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

  /// This function retrieves user data from shared preferences
  /// and updates the state of the widget with
  /// the retrieved data.
  Future<void> getUserdata() async {
    var prefs = await SharedPreferences.getInstance();
    dataList = prefs.getStringList(userKey) ?? [];
    if (dataList.isNotEmpty) {
      setState(() {
        log(dataList.first);
        _nameController.text = dataList[0];
        _emailController.text = dataList[1];
      });
    }
  }
}
