import 'package:astolphus/login/widgets/emailField.widgets.dart';
import 'package:astolphus/login/widgets/loginButton.widget.dart';
import 'package:astolphus/login/widgets/passwordField.widgets.dart';
import 'package:astolphus/login/widgets/signupButton.widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loginView.controller.dart';

class LoginView extends GetView<LoginController> {
  final controller = Get.put(LoginController());

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width * 1.2,
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
                    ), // Substitua este ícone pela sua imagem
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'LOGIN',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 24, // Ajuste o tamanho da fonte conforme necessário
                color: Color.fromRGBO(105, 37, 190, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Form(
                // key: controller.formKey,  // Use o formKey do controlador
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    _buildLabel('Email'),
                    EmailField(),  // Passando o controlador
                    const SizedBox(height: 16),
                    _buildLabel('Senha'),
                    PasswordField(),  // Passando o controlador
                    const SizedBox(height: 32),
                    Loginbutton(),
                    Signupbutton(),
                  ],
                ),
              ),
            ),
          ],
        ),
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
}
