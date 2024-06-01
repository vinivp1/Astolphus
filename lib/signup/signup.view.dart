import 'package:astolphus/signup/widgets/NotifiField.signup.widgets.dart';
import 'package:astolphus/signup/widgets/nameField.signup.widgets.dart';
import 'package:astolphus/signup/widgets/emailField.signup.widgets.dart';
import 'package:astolphus/signup/widgets/passwordField.signup.widgets.dart';
import 'package:astolphus/signup/widgets/RangeField.signup.widgets.dart';
import 'package:astolphus/signup/widgets/signupButton.widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:astolphus/signup/signupView.controller.dart';

class SignupPage extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Astolphus')),
      ),
      body: _body(),
    );
  }
}

_body() {
  return Center(
    child:  ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      children: [
        SizedBox(
          height: Get.height / 10,
        ),
        NameFieldSignup(),
        SizedBox(height:15),
        EmailFieldSignup(),
        SizedBox(height:15),
        PasswordFieldSignup(),
        SizedBox(height:15),
        RangeFieldSignup(),
        SizedBox(height:15),
        NotifiFieldSignup(),
        SizedBox(height:60),
        Signupbutton(),
      ],
    ),
  );
}