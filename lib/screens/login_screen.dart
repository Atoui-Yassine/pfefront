import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pfefront/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController? passworsController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Image.asset(
                "assets/images/logo.png",
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: emailController,
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
              TextFormField(
                controller: passworsController,
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
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Forgot Password?',
                ),
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
                  if (keyForm.currentState!.validate()) {
                    print('form valide');
                    print('email===========>${emailController.text}');
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
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
                      color: Colors.blue,
                    ),
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
    );
  }
}
