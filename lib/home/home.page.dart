import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        leading: const Icon(Icons.person),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
          },
          icon: const Icon(Icons.logout))
        ],
      ),
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