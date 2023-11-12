import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temphumid_app/app/controllers/auth_controller.dart';

import '../controllers/temperature_controller.dart';

class TemperatureView extends GetView<TemperatureController> {
  TemperatureView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => authC.logout(), icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text(
          'TemperatureView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
