import 'package:get/get.dart';

import '../controllers/temperature_controller.dart';

class TemperatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TemperatureController>(
      () => TemperatureController(),
    );
  }
}
