import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temphumid_app/app/controllers/auth_controller.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  final authC = Get.find<AuthController>();
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
      body: const Center(
        child: Text(
          'HistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
