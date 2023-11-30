import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:temphumid_app/app/controllers/auth_controller.dart';

import '../controllers/temperature_controller.dart';

class TemperatureView extends GetView<TemperatureController> {
  final TemperatureController realtimeController =
      Get.put(TemperatureController());
  final authC = Get.find<AuthController>();

  TemperatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TEMPERATURE',
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
        dynamic temperatureData =
            realtimeController.sensorData['dht11']?['temp'];
        double temperatureGauge = temperatureData is int
            ? temperatureData.toDouble()
            : (temperatureData ?? 0.0);

        var temperatureValue =
            realtimeController.sensorData['dht11']?['temp'] ?? 'N/A';

        double fahrenheitValue = (temperatureGauge * 9 / 5) + 32;
        String formattedFahrenheitValue = fahrenheitValue.toStringAsFixed(2);

        double reamurValue = (temperatureGauge * 4 / 5);
        String formattedReamurValue = reamurValue.toStringAsFixed(2);

        double kelvinValue = (temperatureGauge + 273.15);
        String formattedKelvinValue = kelvinValue.toStringAsFixed(2);

        return Padding(
          padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
          child: Column(
            children: [
              Center(
                child: SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 50,
                    radiusFactor: 0.9,
                    startAngle: 180,
                    endAngle: 0,
                    interval: 5,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 0.1,
                      thicknessUnit: GaugeSizeUnit.factor,
                      color: Colors.white,
                      gradient: SweepGradient(
                        colors: [
                          Colors.blue,
                          Colors.green,
                          Colors.orange,
                          Colors.red,
                        ],
                        stops: [0.0, 0.2, 0.7, 1.0],
                      ),
                    ),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: temperatureGauge,
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
                          '$temperatureValue °C',
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
                'Konversi Suhu',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 150.0,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 21, 29, 48),
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 2.0),
                              left: BorderSide(color: Colors.black, width: 2.0),
                              right:
                                  BorderSide(color: Colors.black, width: 2.0),
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
                              'CELCIUS',
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
                        width: 150.0,
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
                              '$temperatureValue °C',
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
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      Container(
                        width: 150.0,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 21, 29, 48),
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 2.0),
                              left: BorderSide(color: Colors.black, width: 2.0),
                              right:
                                  BorderSide(color: Colors.black, width: 2.0),
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
                              'FAHRENHEIT',
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
                        width: 150.0,
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
                              '$formattedFahrenheitValue °F',
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
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 150.0,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 21, 29, 48),
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 2.0),
                              left: BorderSide(color: Colors.black, width: 2.0),
                              right:
                                  BorderSide(color: Colors.black, width: 2.0),
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
                              'REAMUR',
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
                        width: 150.0,
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
                              '$formattedReamurValue °R',
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
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      Container(
                        width: 150.0,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 21, 29, 48),
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 2.0),
                              left: BorderSide(color: Colors.black, width: 2.0),
                              right:
                                  BorderSide(color: Colors.black, width: 2.0),
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
                              'KELVIN',
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
                        width: 150.0,
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
                              '$formattedKelvinValue °K',
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
                ],
              ),
              const SizedBox(
                height: 29,
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
