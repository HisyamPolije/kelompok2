import 'package:get/get.dart';

import '../controllers/humidity_controller.dart';

class HumidityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HumidityController>(
      () => HumidityController(),
    );
  }
}
