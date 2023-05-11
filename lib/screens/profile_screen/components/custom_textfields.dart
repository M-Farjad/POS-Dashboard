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

  static Future<Box<TextFieldModel>> _openTextFieldBox() async {
    return await Hive.openBox<TextFieldModel>('textFieldsBox');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box<TextFieldModel>>(
      future: _openTextFieldBox(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while initializing the Hive box
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          // Handle any error that occurred during box initialization
          return Text('Error initializing Hive box');
        }
        final textFieldBox = snapshot.data;
        if (textFieldBox == null) {
          // Handle the case when the box is null
          return Text('Hive box is null');
        }

        final savedValue = textFieldBox.get('textFieldValue');
        if (savedValue != null && controller != null) {
          // Set the initial value to the controller
          controller!.text = savedValue.name;
        }

        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Responsive.tabletSize * .04),
          child: TextFormField(
            controller: controller,
            onSaved: (val) {
              textFieldBox.put(
                  'textFieldValue', TextFieldModel(name: val!, email: val));
            },
            validator: (val) =>
                val != null && val.isNotEmpty ? null : '* Required',
            decoration: InputDecoration(
              hintText: hintText,
              labelText: title,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              prefixIcon: Icon(iconData),
            ),
          ),
        );
      },
    );
  }
}
