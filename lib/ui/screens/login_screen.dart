import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:machinetest/ui/screens/theme/text_style.dart';
import 'package:machinetest/ui/screens/widget/auth_textfield_widget.dart';
import 'package:machinetest/ui/screens/widget/common_scaffold.dart';

import '../../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static LoginController signInController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      resizeToAvoidBottomInset: true,
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: Get.height / 3,
                    child: Image.asset('assets/images/logo.png')),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    children: [
                      Form(
                        key: signInController.signInKey,
                        child: AuthTextFieldCommon(
                          labelText: "User name",
                          controller: signInController.name,
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          textInputFormatter: [
                            LengthLimitingTextInputFormatter(50)
                          ],
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "email_empty_err".tr;
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) =>
                              signInController.name.text = value!,
                        ),
                      ),
                      AuthTextFieldCommon(
                        labelText: "password".tr,
                        controller: signInController.password,
                        password: true,
                        maxLength: 10,
                        textInputFormatter: [
                          LengthLimitingTextInputFormatter(10)
                        ],
                        keyboardType: TextInputType.text,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "password_empty_err".tr;
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) =>
                            signInController.password.text = value!,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  width: Get.width / 1.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      primary: Theme.of(Get.context!).primaryColor,
                    ),
                    onPressed: () => signInController.signIn(),
                    child: const Text("Login", style: buttonText),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  width: Get.width / 1.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      primary: Theme.of(Get.context!).primaryColor,
                    ),
                    onPressed: () => signInController.clearAll(),
                    child: const Text("Clear", style: buttonText),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
