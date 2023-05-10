import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../../../configs/themes/custom_text_styles.dart';
import '../../../configs/themes/ui_parameters.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.email,
    required this.password,
    required this.formKey,
  });
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final FocusNode _emailFocusNode = FocusNode();
    final FocusNode _passwordFocusNode = FocusNode();
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: email,
            cursorColor: Colors.black,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              label: kTextFormLabel('Email'),
            ),
            textInputAction: TextInputAction.next,
            focusNode: _emailFocusNode,
            onFieldSubmitted: (term) {
              _emailFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            validator: emailValidator,
          ),
          kHeightSpace,
          kHalfHeightpace,
          TextFormField(
            controller: password,
            obscureText: true,
            cursorColor: Colors.black,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              label: kTextFormLabel('Password'),
            ),
            textInputAction: TextInputAction.done,
            focusNode: _passwordFocusNode,
            validator: passwordValidator,
          ),
        ],
      ),
    );
  }

  String? emailValidator(String? val) {
    if (val == null || val == '') {
      return 'Please Enter Email';
    } else if (isEmailValid(val) == false) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    } else {
      List<String> errors = [];
      if (password.length < 8) {
        errors.add('Required 8 characters long');
      }
      if (!password.contains(RegExp(r'[A-Z]'))) {
        errors.add('Required one uppercase letter');
      }
      if (!password.contains(RegExp(r'[a-z]'))) {
        errors.add('Required one lowercase letter');
      }
      if (!password.contains(RegExp(r'[0-9]'))) {
        errors.add('Required one digit');
      }
      if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        errors.add('Required one speacial character');
      }

      if (errors.isEmpty) {
        return null;
      } else {
        String error = '';
        for (int i = 0; i < errors.length; i++) {
          error += errors[i];
          if (i != errors.length - 1) error += '\n';
        }
        return error;
      }
    }
  }

  bool isEmailValid(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
    return regex.hasMatch(email);
  }
}
