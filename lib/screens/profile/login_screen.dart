import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfefront/controllers/profile_controller.dart';
import 'package:pfefront/core/widgets/base_layout.dart';
import 'package:pfefront/screens/home/proposition_financement_screen.dart';
import 'package:pfefront/screens/profile/forgot_password_screen.dart';
import 'package:pfefront/screens/profile/signup_screen.dart';

//-------------------liaison etre interface et conteroller
class LoginScreen extends GetView<ProfileController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      widget: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: controller.keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome Back",
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
                  height: 35,
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
                GetBuilder<ProfileController>(
                  builder: (controller) => TextFormField(
                    obscureText: controller.isVisible,
                    controller: controller.passworsController,
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
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  ),
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
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
                    //  if (controller.keyForm.currentState!.validate()) {
                    print('form valide');
                    print(
                        'email===========>${controller.emailController.text}');
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const PropositionFinancementScreen(),
                    ));
                    // }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text.rich(
                  TextSpan(text: "Don't have an account? ", children: [
                    TextSpan(
                      text: "SignUp",
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
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
    );
  }
}
