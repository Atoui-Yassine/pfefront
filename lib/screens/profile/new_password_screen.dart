import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pfefront/controllers/profile_controller.dart';
import 'package:pfefront/screens/profile/login_screen.dart';
import 'package:pfefront/screens/profile/signup_screen.dart';

class NewPasswordScreen extends GetView<ProfileController> {
  const NewPasswordScreen({super.key});

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
          onPressed: () {
            print('ssssssssssssssssssss');
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          key: controller.keyFormNewP,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Create a New Password",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const SizedBox(
                height: 25,
              ),
              GetBuilder<ProfileController>(
                builder: (controller) => TextFormField(
                  obscureText: controller.isVisible,
                  controller: controller.passworsController,
                  decoration: InputDecoration(
                    label: const Text("New Password"),
                    hintText: "tapez votre password ",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      //()=> fonction fleche   (){ } fonction anonyme
                      onPressed: () => controller.showPassword(),
                      icon: Icon(
                        // if else  condition   ? condition true : conditionfalse
                        controller.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre password";
                    } else if (value.length < 6) {
                      return "tapez un password valide";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<ProfileController>(
                builder: (controller) => TextFormField(
                  obscureText: controller.isVisibleConfirmPwd,
                  controller: controller.confirmPassworsController,
                  decoration: InputDecoration(
                    label: const Text("Confirm New Password"),
                    hintText: "tapez votre password ",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      //()=> fonction fleche   (){ } fonction anonyme
                      onPressed: () => controller.showConfirmPwd(),
                      icon: Icon(
                        // if else  condition   ? condition true : conditionfalse
                        controller.isVisibleConfirmPwd
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre password";
                    } else if (controller.passworsController!.text !=
                        controller.confirmPassworsController!.text) {
                      return "tapez un password valide";
                    }
                    return null;
                  },
                ),
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
                  if (controller.keyFormNewP.currentState!.validate()) {
                    print('form valide${controller.confirmPassworsController}');
                    Get.to(const LoginScreen());
                  }
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
