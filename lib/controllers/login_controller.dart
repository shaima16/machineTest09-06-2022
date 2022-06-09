import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/screens/home_screen.dart';
import '../ui/screens/widget/dialog.dart';

class LoginController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    clearAll();
  }

  @override
  void dispose() {
    super.dispose();
    clearAll();
  }

  void clearAll() {
    name.clear();
    password.clear();
  }

  Future<void> signIn() async {
    if (signInKey.currentState!.validate()) {
      Dialogs.loading();
      if (name.text.toString().trimRight() ==
          password.text.toString().trimRight()) {
        Get.back();
        showSnackBar(message: 'Successfully login');
        Get.offAll(() => const HomeScreen());
      } else {
        Get.back();
        showSnackBar(message: 'Invalid credentials');
      }
    }
  }
}
