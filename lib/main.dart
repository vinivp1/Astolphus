import 'package:flutter/material.dart';
import 'package:astolphus/login/login.view.dart';
import 'package:get/get.dart';
import 'login/login.bindings.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: LoginBindings(),
      title: 'Astolphus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,  
        useMaterial3: true,
      ),
      home: const LoginView(), 
    );
  }
}
