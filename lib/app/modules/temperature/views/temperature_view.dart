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
        title: const Text('TemperatureView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => authC.logout(), icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        double temperatureGauge =
            realtimeController.sensorData['dht11']?['temp'] ?? 0.0;

        var temperatureValue =
            realtimeController.sensorData['dht11']?['temp'] ?? 'N/A';

        // double fahrenheitValue = (temperatureValue * 9/5) + 32;

        return Padding(
          padding: const EdgeInsets.only(top: 50, left: 8, right: 8),
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
                            fontSize: 20,
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
                            color: Colors.white,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CELCIUS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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
                            color: Colors.white,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CELCIUS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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
                            color: Colors.white,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CELCIUS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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
                            color: Colors.white,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CELCIUS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
