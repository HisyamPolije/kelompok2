import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class TemperatureController extends GetxController {
  var sensorData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
    databaseRef.onValue.listen((event) async {
      final dynamic value = event.snapshot.value;
      if (value != null && value is Map) {
        sensorData.value = Map<String, dynamic>.from(value);
        // if (sensorData['dht11'] != null &&
        //     sensorData['dht11']['temp'] != null &&
        //     sensorData['dht11']['temp'] >= 30) {}
      }
    });
  }
}
