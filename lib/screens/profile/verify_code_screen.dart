import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pfefront/controllers/profile_controller.dart';
import 'package:pfefront/screens/profile/new_password_screen.dart';
import 'package:pfefront/screens/profile/signup_screen.dart';

class VerifyCodeScreen extends GetView<ProfileController> {
  const VerifyCodeScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          key: controller.keyFormVeify,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Verify ",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Please enter the code we sent you to email ",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
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
                  Get.to(const NewPasswordScreen());
                },
                child: const Text(
                  "Verify",
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
    );
  }
}
