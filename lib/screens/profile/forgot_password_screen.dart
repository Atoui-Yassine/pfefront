import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfefront/controllers/profile_controller.dart';
import 'package:pfefront/screens/profile/signup_screen.dart';
import 'package:pfefront/screens/profile/verify_code_screen.dart';

class ForgotPasswordScreen extends GetView<ProfileController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Forgot Password ",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Form(
              key: controller.keyFormForgot,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Image.asset(
                    "assets/images/forgotpwd.png",
                    width: 150,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                      hintText: "tapez votre email ",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " sil vous plait tapez votre email";
                      } else if (!EmailValidator.validate(value)) {
                        return "tapez un email valide";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20)),
                    onPressed: () {
                      if (controller.keyFormForgot.currentState!.validate()) {
                        print('form valide');
                        print(
                            'email===========>${controller.emailController.text}');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const VerifyCodeScreen(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
