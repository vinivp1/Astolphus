import 'package:astolphus/signup/widgets/NotifiField.signup.widgets.dart';
import 'package:astolphus/signup/widgets/nameField.signup.widgets.dart';
import 'package:astolphus/signup/widgets/emailField.signup.widgets.dart';
import 'package:astolphus/signup/widgets/passwordField.signup.widgets.dart';
import 'package:astolphus/signup/widgets/RangeField.signup.widgets.dart';
import 'package:astolphus/signup/widgets/signupButton.widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'signupView.controller.dart';


class SignupPage extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Astolphus')),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 3,
            width: MediaQuery
                .of(context)
                .size
                .width * 1.2,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(105, 37, 190, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.pets,
                    size: 100,
                    color: Color.fromRGBO(105, 37, 190, 1),
                  ), // Replace this with your image later
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'CADASTRAR-SE',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 24, // You can adjust the font size as needed
              color: Color.fromRGBO(105, 37, 190, 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  _buildLabel('Nome'),
                  NameFieldSignup(),
                  const SizedBox(height: 16),
                  _buildLabel('Email'),
                  EmailFieldSignup(),
                  const SizedBox(height: 16),
                  _buildLabel('Senha'),
                  PasswordFieldSignup(),
                  const SizedBox(height: 16),
                  _buildLabel('Raio de segurança'),
                  RangeFieldSignup(),
                  const SizedBox(height: 16),
                  _buildLabel('Notificações'),
                  NotifiFieldSignup(),
                  const SizedBox(height: 32),
                  Signupbutton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: Color.fromRGBO(105, 37, 190, 1),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        fillColor: Color.fromRGBO(211, 211, 211, 1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(fontFamily: 'Poppins'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Por favor, preencha este campo';
        }
        return null;
      },
    );
  }
}