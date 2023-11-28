import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temphumid_app/app/controllers/auth_controller.dart';
import 'package:temphumid_app/app/modules/temperature/controllers/temperature_controller.dart';

import '../controllers/humidity_controller.dart';

class HumidityView extends GetView<HumidityController> {
  final TemperatureController realtimeController =
      Get.put(TemperatureController());
  final authC = Get.find<AuthController>();
  HumidityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HUMIDITY'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => authC.logout(), icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text(
          'HumidityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
