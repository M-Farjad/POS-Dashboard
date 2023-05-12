import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../responsive.dart';
import 'text_field_model.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final IconData iconData;

  CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
    required this.iconData,
    required this.hintText,
  }) : super(key: key);

  // static Future<Box<TextFieldModel>> _openTextFieldBox() async {
  //   return await Hive.openBox<TextFieldModel>('textFieldsBox');
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Responsive.tabletSize * .04),
      child: TextFormField(
        controller: controller,
        onSaved: (val) {
          // textFieldBox.put(
          //     'textFieldValue', TextFieldModel(name: val!, email: val));
        },
        validator: (val) => val != null && val.isNotEmpty ? null : '* Required',
        decoration: InputDecoration(
          hintText: hintText,
          labelText: title,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          prefixIcon: Icon(iconData),
        ),
      ),
    );
  }
}
