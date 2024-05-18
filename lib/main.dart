import 'package:flutter/material.dart';
import 'package:astolphus/pages/login_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astolphus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,  
        useMaterial3: true,
      ),
      home: const LoginPage(), 
    );
  }
}
