import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temphumid_app/app/controllers/auth_controller.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  final authC = Get.find<AuthController>();
  final HistoryController historyController = Get.put(HistoryController());
  final DatabaseReference historyRef = FirebaseDatabase.instance.ref();
  HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'HISTORY',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'novasquare',
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => authC.logout(),
              icon: const Icon(Icons.logout),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, // Warna bayangan
                    blurRadius: 5.0, // Jarak blur
                    offset: Offset(0, 3), // Posisi bayangan
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 45, right: 45),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 375,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 21, 29, 48),
                        border: Border(
                          top: BorderSide(color: Colors.black, width: 2.0),
                          left: BorderSide(color: Colors.black, width: 2.0),
                          right: BorderSide(color: Colors.black, width: 2.0),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              20.0), // Atur radius sesuai keinginan
                          topRight: Radius.circular(20.0),
                        )),
                    margin: const EdgeInsets.only(bottom: 0),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HISTORY SUHU',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 375,
                    height: 275,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(
                              20.0), // Atur radius sesuai keinginan
                          bottomRight: Radius.circular(20.0),
                        )),
                    margin: const EdgeInsets.only(top: 0),
                    child: Obx(
                      () {
                        if (controller.historyKosong.value) {
                          return const Center(
                            child: Text('Tidak ada riwayat.'),
                          );
                        } else {
                          return StreamBuilder(
                            stream: historyRef.child('history').onValue,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                DataSnapshot data = snapshot.data!.snapshot;
                                if (data.value != null) {
                                  Map<dynamic, dynamic> values =
                                      data.value as Map<dynamic, dynamic>;
                                  List<dynamic> historyList =
                                      values.values.toList();

                                  return ListView.builder(
                                    itemCount: historyList.length,
                                    itemBuilder: (context, index) {
                                      String message =
                                          historyList[index]['message'];
                                      int itemNumber = index + 1;
                                      return ListTile(
                                        title: Text(
                                          '$itemNumber. $message',
                                          style: const TextStyle(
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return const Center(
                                    child: Text('Tidak ada data histori',
                                        style: TextStyle(
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  );
                                }
                              } else {
                                // Menunggu data
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 404),
                  const Text(
                    'Copyright',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Kelompok 2 TempHumid 2023',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'poppins'),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
