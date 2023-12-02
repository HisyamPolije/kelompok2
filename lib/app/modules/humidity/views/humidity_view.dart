import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:temphumid_app/app/controllers/auth_controller.dart';
import 'package:temphumid_app/app/modules/temperature/controllers/temperature_controller.dart';

import '../controllers/humidity_controller.dart';

class HumidityView extends GetView<HumidityController> {
  final TemperatureController realtimeController =
      Get.put(TemperatureController());
  final authC = Get.find<AuthController>();
  HumidityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HUMIDITY',
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
      body: Obx(() {
        dynamic humidityData = realtimeController.sensorDht11['dht11']?['humi'];
        double humidityGauge = humidityData is int
            ? humidityData.toDouble()
            : (humidityData ?? 0.0);

        var humidityValue =
            realtimeController.sensorDht11['dht11']?['humi'] ?? 'N/A';

        // Status yang akan keluar jika data yang masuk berubah
        String getHumidityStatus(double humidityValue) {
          if (humidityValue >= 1 && humidityValue <= 30) {
            return "Terlalu Kering";
          } else if (humidityValue > 30 && humidityValue <= 45) {
            return "Kering";
          } else if (humidityValue > 45 && humidityValue <= 60) {
            return "Normal";
          } else if (humidityValue > 60 && humidityValue <= 80) {
            return "Lembab";
          } else {
            return "Terlalu Lembab";
          }
        }

        String humidityStatus = getHumidityStatus(humidityGauge);

        return Padding(
          padding: const EdgeInsets.only(top: 100, left: 8, right: 8),
          child: Column(
            children: [
              Center(
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    radiusFactor: 1,
                    interval: 5,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 0.1,
                      thicknessUnit: GaugeSizeUnit.factor,
                      color: Colors.white,
                      gradient: SweepGradient(
                        colors: [
                          Colors.red,
                          Colors.orange,
                          Colors.green,
                          Colors.blue,
                        ],
                        stops: [0.0, 0.3, 0.6, 1.0],
                      ),
                    ),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: humidityGauge,
                        enableAnimation: true,
                        animationDuration: 200,
                        needleStartWidth: 1,
                        needleEndWidth: 3,
                        knobStyle: const KnobStyle(
                          color: Colors.white,
                          knobRadius: 0.05,
                          borderColor: Colors.black,
                          borderWidth: 0.02,
                        ),
                        tailStyle: const TailStyle(
                          width: 5,
                          length: 20,
                          lengthUnit: GaugeSizeUnit.logicalPixel,
                          color: Colors.white,
                          borderWidth: 3,
                          borderColor: Colors.black,
                        ),
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        angle: 90,
                        positionFactor: 0.5,
                        widget: Text(
                          '$humidityValue %',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              const SizedBox(height: 0),
              const Text(
                'Informasi Kelembapan',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Column(
                children: [
                  Container(
                    width: 200,
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
                          'KELEMBAPAN SAAT INI',
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
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(
                              20.0), // Atur radius sesuai keinginan
                          bottomRight: Radius.circular(20.0),
                        )),
                    margin: const EdgeInsets.only(top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$humidityValue %' '\n' '( $humidityStatus )',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 124,
              ),
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
                    color: Colors.black, fontSize: 14, fontFamily: 'poppins'),
              )
            ],
          ),
        );
      }),
    );
  }
}
