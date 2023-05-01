import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final emailController = TextEditingController();
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              iconData: Icons.email_rounded,
              controller: _nameController,
            ),
            SizedBox(height: mq.height * 0.05),
          ],
        ),
      ),
    );
  }
}

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
  TextEditingController? controller;
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
          prefixIcon: Icon(iconData, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
