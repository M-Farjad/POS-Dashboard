import 'package:flutter/material.dart';
import 'package:yums_dashboard/constants/constants.dart';

import '../../../main.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    // this.initialText,
    required this.controller,
    required this.iconData,
    required this.hintText,
  });
  final String title;
  final String hintText;

  // final String? initialText;
  final TextEditingController? controller;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
      child: TextFormField(
        // controller: controller,
        onSaved: (val) {},
        validator: (val) => val != null && val.isNotEmpty ? null : '*Required',
        initialValue: controller!.text, //?? Yaha error hn
        decoration: InputDecoration(
          hintText: hintText,
          label: Text(title),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          prefixIcon: Icon(iconData, color: bodyColor),
        ),
      ),
    );
  }
}
