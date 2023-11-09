import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:temphumid_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void register(String username, String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Register Error',
          'The password provided is too weak.',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Register Error',
          'The email is already in use.',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(Routes.NAVIGATION);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Login Error',
          'No user found for that email.',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Login Error',
          'Wrong password provided for that user.',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
