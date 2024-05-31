import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfefront/controllers/home_controller.dart';
import 'package:pfefront/core/widgets/custom_drawer.dart';

class PropositionFinancementScreen extends GetView<HomeController> {
  const PropositionFinancementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Form(
              key: controller.keyForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Proposition de financement",
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
                  TextFormField(
                    //   controller: controller.emailController,
                    decoration: const InputDecoration(
                      label: Text("Montant d'achat TTC"),
                      hintText: "1000 dt",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.money,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " sil vous plait tapez montant TTC";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    //   controller: controller.emailController,
                    decoration: const InputDecoration(
                      label: Text("Apport personnel"),
                      hintText: "1000 dt",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.money,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " sil vous plait tapez Apport personnel";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    //   controller: controller.emailController,
                    decoration: const InputDecoration(
                      label: Text("Montant à fianncier"),
                      hintText: "1000 dt",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.money,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " sil vous plait tapez Montant à fianncier";
                      }
                      return null;
                    },
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
                      if (controller.keyForm.currentState!.validate()) {
                        print('form valide');
                      }
                    },
                    child: const Text(
                      "Simuler",
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
