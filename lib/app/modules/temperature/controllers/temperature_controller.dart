import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemperatureController extends GetxController {
  var sensorDht11 = {}.obs;
  var isLoggedIn = false.obs; //menandakan status Login

  void showSnackbar(String message) {
    Get.snackbar(
      'Peringatan',
      '',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      titleText: RichText(
        text: const TextSpan(
          text: 'Peringatan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      messageText: RichText(
        text: TextSpan(
          text: message,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
    DatabaseReference historyRef = FirebaseDatabase.instance.ref('history');

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      // Perbarui status login saat perubahan status autentikasi
      isLoggedIn.value = user != null;
    });

    databaseRef.onValue.listen((event) async {
      final dynamic value = event.snapshot.value;
      if (value != null && value is Map) {
        sensorDht11.value = Map<String, dynamic>.from(value);
        if (sensorDht11['dht11'] != null &&
            sensorDht11['dht11']['temp'] != null &&
            sensorDht11['dht11']['temp'] >= 32) {
          final suhu = sensorDht11['dht11']['temp'];
          final timestamp = DateTime.now();
          final timestampString = timestamp.toIso8601String();
          final message = 'Suhu Telah Mencapai $suhu °C';
          final existingData =
              await historyRef.orderByChild('temp').equalTo(suhu).once();
          if (existingData.snapshot.value == null) {
            // Tidak ada data dengan suhu yang sama, tambahkan notifikasi baru
            final newHistoryRef = historyRef.push();
            newHistoryRef.set({
              'message': message,
              'temp': suhu,
              'timestamp': timestampString,
            });
            showSnackbar('Suhu Telah Mencapai $suhu °C');
          }
        }
      }
    });
  }
}
