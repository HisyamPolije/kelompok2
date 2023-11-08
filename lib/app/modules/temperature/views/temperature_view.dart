import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/temperature_controller.dart';

class TemperatureView extends GetView<TemperatureController> {
  const TemperatureView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'TemperatureView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
