import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/humidity_controller.dart';

class HumidityView extends GetView<HumidityController> {
  const HumidityView({Key? key}) : super(key: key);
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
