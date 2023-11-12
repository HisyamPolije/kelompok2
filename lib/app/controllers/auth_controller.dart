import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:temphumid_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void showSnackbar(String message) {
    Get.snackbar(
      'Pemberitahuan',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void showSnackbar1(String message) {
    Get.snackbar(
      'Cek Email',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void showSnackbar2(String message) {
    Get.snackbar(
      'Peringatan',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  void register(String username, String email, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await myUser.user!.sendEmailVerification();

      showSnackbar1(
          'Registrasi berhasil, Silahkan Cek Email Kami, Sudah Mengirim Verivikasi Email ke $email');

      Get.offAllNamed(Routes.LOGIN);
      // if (myUser.user!.emailVerified) {

      // } else {
      //   Get.defaultDialog(
      //       title: "Verifikasi Email",
      //       middleText: "Kamu Perlu Memverifikasi Email Terlebih Dahulu");
      // }
      // Registrasi berhasil, tampilkan Snackbar
    } catch (e) {
      print('error accured $e');
      // Handle specific error messages
      if (e is FirebaseAuthException) {
        String errorMessage = '';
        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = 'Email sudah digunakan.';
            break;
          case 'weak-password':
            errorMessage = 'Password terlalu lemah.';
            break;
          case 'invalid-email':
            errorMessage = 'Format email tidak valid.';
            break;
        }
        showSnackbar2(errorMessage);
      }
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user!.emailVerified) {
        showSnackbar('Login berhasil!');

        Get.offAllNamed(Routes.NAVIGATION);
      } else {
        Get.defaultDialog(
            title: "Verifikasi Email",
            middleText:
                "Anda Perlu Memverifikasi Email Terlebih Dahulu, Apakah Anda Ingin Verivikasi Kembali ?",
            onConfirm: () async {
              await myUser.user!.sendEmailVerification();
              Get.back();
            },
            textConfirm: "Kirim Ulang Verifikasi Email",
            textCancel: "kembali");
      }
    } catch (e) {
      print('error accured $e');
      // Handle specific error messages
      if (e is FirebaseAuthException) {
        String errorMessage = '';
        switch (e.code) {
          case 'INVALID_LOGIN_CREDENTIALS':
            errorMessage = 'Email atau password tidak valid.';
            break;
        }
        showSnackbar2(errorMessage);
      }
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
