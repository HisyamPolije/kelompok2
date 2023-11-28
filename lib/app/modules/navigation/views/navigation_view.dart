import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:temphumid_app/app/modules/about/views/about_view.dart';
import 'package:temphumid_app/app/modules/history/views/history_view.dart';
import 'package:temphumid_app/app/modules/humidity/views/humidity_view.dart';
import 'package:temphumid_app/app/modules/temperature/views/temperature_view.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  NavigationView({Key? key}) : super(key: key);

  final screens = [
    TemperatureView(),
    HumidityView(),
    const HistoryView(),
    const AboutView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
            index: controller.selectedIndex.value, children: screens),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 21, 29, 48)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
            gap: 8,
            backgroundColor: const Color.fromARGB(255, 21, 29, 48),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.thermostat,
                text: 'Temperature',
              ),
              GButton(
                icon: Icons.invert_colors_on,
                text: 'Humidity',
              ),
              GButton(
                icon: Icons.history,
                text: 'History',
              ),
              GButton(
                icon: Icons.settings,
                text: 'About',
              ),
            ],
            onTabChange: (value) {
              controller.changeIndex(value);
            },
          ),
        ),
      ),
    );
  }
}
