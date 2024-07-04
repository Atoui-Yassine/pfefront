import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pfefront/controllers/profile_controller.dart';
import 'package:pfefront/core/widgets/app_text_form_field.dart';
import 'package:pfefront/screens/profile/new_password_screen.dart';

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
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          key: controller.keyFormCode,
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
                    width: 5,
                  ),
                  SizedBox(
                    width: 50,
                    //    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: AppTextFormField(
                      controller: controller.code1Controller,
                      hintText: "",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  SizedBox(
                    width: 50,
                    //padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: AppTextFormField(
                      controller: controller.code2Controller,
                      hintText: "",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  SizedBox(
                    width: 50,
                    //  padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: AppTextFormField(
                      controller: controller.code3Controller,
                      hintText: "",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  SizedBox(
                    width: 50,
                    //  padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: AppTextFormField(
                      controller: controller.code4Controller,
                      hintText: "",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                      },
                      backgroundColor: Colors.grey[200],
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  SizedBox(
                    width: 50,
                    //padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: AppTextFormField(
                      controller: controller.code5Controller,
                      hintText: "",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                      },
                      backgroundColor: Colors.grey[200],
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  SizedBox(
                    width: 50,
                    // padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: AppTextFormField(
                      hintText: "",
                      controller: controller.code6Controller,
                      backgroundColor: Colors.grey[200],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20)),
                onPressed: () {
                  if (controller.keyFormCode.currentState!.validate()) {
                    Get.to(const NewPasswordScreen());
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
