import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temphumid_app/app/modules/temperature/controllers/temperature_controller.dart';

import '../controllers/humidity_controller.dart';

class HumidityView extends GetView<HumidityController> {
  final TemperatureController realtimeController =
      Get.put(TemperatureController());
  HumidityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'HumidityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
