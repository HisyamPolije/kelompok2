import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temphumid_app/app/controllers/auth_controller.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  final authC = Get.find<AuthController>();
  AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ABOUT',
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
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10, right: 25, left: 25),
                child: Image(image: AssetImage('assets/images/logo.png'))),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 25, left: 25),
              child: Text(
                'Aplikasi TempHumid merupakan singkatan dari (Temperature & Humidity). Aplikasi ini dibuat untuk menyelasaikan tugas matakuliah Workshop Aplikasi Mobile yang di Ampu Bapak Dosen Muhammad Hafidh Firmansyah, S.Tr.Kom., M.Sc. Aplikasi berguna untuk memonitoring atau melihat kondisi suhu dan kelembapan di ruang tertentu. Misal kita menaruh project IoT pada Kamar Tidur, maka sensor suhu (DHT11) akan memunculkan tingkat suhu dan kelembapan pada kamar tidur tersebut, dan akan ditampilkan pada apliasi ini secara realtime.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'agbalumo',
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, right: 15, left: 15),
              child: Text(
                'Aplikasi ini dibuat oleh :\n Muhammad Hisyamuddin (E32222650) sebagai Leader,\n dan 3 orang anggota lainya yaitu :\n 1.Ega Saputra Wicaksana (E32222485).\n 2. Imam Ghazali Munir (E32222855).\n 3. Nur Naim (E32222...).',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'playpen',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, right: 25, left: 25),
              child: Text(
                'Aplikasi ini kami buat dengan semaksimal mungkin dengan pengetahuan yang kita punya, kalau bicara tentang kata "Sempurna" memang aplikasi kami ini belum bisa berjalang seng sesempurna itu, mungkin masih ada bug atau kesalahan yang kami belum sadari atau belum bisa kita benahi. Ada pun yang perlu diingat teknologi IoT ini harus terkoneksi dengan Internet, jika tidak terkoneksi internet maka tidak akan bisa bekerja. yang terakhir kali saya ucapkan Terimakasih kepada Bapak Muhammad Hafidh Firmansyah, S.Tr.Kom., M.Sc. selaku dosen dan semua pihak yang ikut berpartisipasi dalam terbentuknya aplikasi ini.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'agbalumo',
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 71,
            ),
            Text(
              'Copyright',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Kelompok 2 TempHumid 2023',
              style: TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: 'poppins'),
            )
          ],
        ));
  }
}
