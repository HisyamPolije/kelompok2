import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
            Color.fromARGB(255, 21, 29, 48),
            Color.fromARGB(255, 255, 169, 36)
          ]))),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 21, 29, 48),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
              gap: 8,
              backgroundColor: Color.fromARGB(255, 21, 29, 48),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey,
              padding: EdgeInsets.all(16),
              tabs: [
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
                )
              ]),
        ),
      ),
    );
  }
}
