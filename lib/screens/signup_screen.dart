import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:html' as html;
import 'dart:html';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:pfefront/controllers/profile_controller.dart';
import 'package:pfefront/screens/login_screen.dart';

class SignUpScreen extends GetView<ProfileController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: controller.keyForm,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    width: 180,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("UserName"),
                      hintText: "tapez votre username ",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " sil vous plait tapez votre username";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
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
                    height: 15,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Phone"),
                      hintText: "tapez votre phone ",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " sil vous plait tapez votre phone";
                      } else if (value.length < 8) {
                        return "tapez un phone number valide";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GetBuilder<ProfileController>(
                    builder: (controller) => DropdownButton(
                        hint: const Text('role'),
                        // Initial Value
                        value: controller.selectedValue,

                        // Down Arrow Icon
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),

                        // Array list of items
                        items: controller.listRole.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (value) {
                          controller.onChnagedDropDown(value!);
                        }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GetBuilder<ProfileController>(
                    builder: (controller) => Row(
                      children: [
                        Visibility(
                          visible: controller.visibility,
                          child: InkWell(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: const Text('ajouter un image')),
                            onTap: () {
                              controller.pickFile();
                            },
                          ),
                        ),
                        controller.pickedFile != null &&
                                controller.fileBytes != null
                            ? Column(
                                children: [
                                  Image.memory(
                                    controller.fileBytes!,
                                    width: 50,
                                    height: 50,
                                  ),
                                  Text(controller.pickedFile!.name),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: const Text("Password"),
                      hintText: "tapez votre password ",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        //()=> fonction fleche   (){ } fonction anonyme
                        onPressed: () => print('print tcon'),
                        icon: const Icon(
                          Icons.visibility,
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
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 150, vertical: 20)),
                    onPressed: () {
                      if (controller.keyForm.currentState!.validate()) {
                        print('form valide');
                      }
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text.rich(
                    TextSpan(text: "Already have an account? ", children: [
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
