import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/screens/login_screen.dart';

void main() {
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  );
}
