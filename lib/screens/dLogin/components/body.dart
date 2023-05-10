import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/custom_menu_controller.dart';
import './login_form.dart';
import 'login_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Column(
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: 100,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          height: 100 / 10,
        ),
        const Text(
          'LIVROUTE DRIVER',
          style: TextStyle(
            color: Colors.black,
            fontSize: 100 / 5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 50),
        LoginForm(
          email: email,
          password: password,
          formKey: formKey,
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: LoadingButton(
            text: 'Login',
            onTap: () async {
              await loginFunction(formKey, email, password);
            },
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Future<void> loginFunction(GlobalKey<FormState> formKey,
      TextEditingController email, TextEditingController password) async {
    if (formKey.currentState!.validate()) {
      await Future.delayed(const Duration(seconds: 2));
      Get.find<CustomMenuController>().selectedItem.value = MenuItems.home;
    } else {}
  }
}
