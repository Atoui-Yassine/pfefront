import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              const Text("Login"),
              const SizedBox(
                height: 25,
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
                height: 10,
              ),
              TextFormField(
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
                  side: const BorderSide(
                    width: 3,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  if (keyForm.currentState!.validate()) {
                    print('form valide');
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
