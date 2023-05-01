import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class Body extends StatelessWidget {
  Body({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //for adding some space
            SizedBox(width: mq.width, height: mq.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
              child: TextFormField(
                onSaved: (val) {},
                validator: (val) =>
                    val != null && val.isNotEmpty ? null : '*Required',
                initialValue: 'Salman Pagal',
                decoration: InputDecoration(
                  hintText: 'e.g Muhammad Farjad',
                  label: const Text('Name'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Icon(CupertinoIcons.person,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            SizedBox(height: mq.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
              child: TextFormField(
                onSaved: (val) {},
                validator: (val) =>
                    val != null && val.isNotEmpty ? null : '*Required',
                initialValue: 'abc@example.com',
                decoration: InputDecoration(
                  hintText: 'e.g abc@example.com',
                  label: const Text('Email'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  prefixIcon: Icon(Icons.email_rounded,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            SizedBox(height: mq.height * 0.05),
          ],
        ),
      ),
    );
  }
}
