import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:temphumid_app/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.blue, Colors.green])),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 65, bottom: 60, top: 60),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 90),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "monitoring suhu dan kelembaban",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Container(
              height: 602,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 30, right: 30, left: 30),
                child: Column(
                  //logo
                  children: <Widget>[
                    const Image(
                      width: 270,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      //box username, email dan password
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.blue,
                                blurRadius: 20,
                                offset: Offset(0, 10)),
                          ]),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            //username
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: const TextField(
                                decoration: InputDecoration(
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                        fontFamily: 'poppins',
                                        color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            ),
                            //email
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: const TextField(
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        fontFamily: 'poppins',
                                        color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            ),
                            //password
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: const TextField(
                                decoration: InputDecoration(
                                    hintText: 'password',
                                    hintStyle: TextStyle(
                                        fontFamily: 'poppins',
                                        color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    //Tombol Register
                    ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.cyan),
                          fixedSize: MaterialStateProperty.all(Size(240, 50)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),

                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sudah punya akun? ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'poppins'),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.LOGIN);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontFamily: 'poppins'),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 50,
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
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'poppins'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
