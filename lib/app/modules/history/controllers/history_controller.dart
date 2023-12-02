import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  DatabaseReference historyRef =
      FirebaseDatabase.instance.ref().child('history');
  RxList<Map<String, dynamic>> historyData = <Map<String, dynamic>>[].obs;
  RxBool historyKosong = true.obs; // Tambahkan variabel ini

  @override
  void onInit() {
    super.onInit();
    historyRef.once().then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        final dynamic value = event.snapshot.value;
        if (value != null && value is Map) {
          Map<String, dynamic> history = value.cast<String, dynamic>();
          List<Map<String, dynamic>> historyList = history.entries
              .map((entry) => <String, dynamic>{entry.key: entry.value})
              .toList();
          historyData.assignAll(historyList);
          historyKosong.value = false; // false jika ada data history
        }
      }
    });
  }
}
