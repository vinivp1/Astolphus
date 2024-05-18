import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }     
}

  _body() {
    return Center(
      child:  ListView(
        // padding: const EdgeInsets.all(8),
        // children: const [Loginbutton()],
      ),
    );
  }