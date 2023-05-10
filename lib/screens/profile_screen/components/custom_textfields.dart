import 'package:flutter/material.dart';

import '../../../configs/themes/app_color.dart';
import '../../../responsive.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
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
      padding: EdgeInsets.symmetric(horizontal: Responsive.tabletSize * .04),
      child: TextFormField(
        controller: controller,

        onSaved: (val) {},
        validator: (val) => val != null && val.isNotEmpty ? null : '*Required',
        // initialValue: readLocalData() == null
        //     ? controller!.text
        //     : readLocalData(), //?? Yaha error hn
        decoration: InputDecoration(
          hintText: hintText,
          label: Text(title),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          prefixIcon: Icon(iconData, color: bgColorLight),
        ),
      ),
    );
  }
}
