import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfefront/controllers/TaskInfo%20.dart';
import 'package:pfefront/controllers/home_controller.dart';
import 'package:pfefront/core/storage/app_storage.dart';
import 'package:pfefront/screens/home/proposition_financement_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class PaymentSmartPhone extends GetView<HomeController> {
  PaymentSmartPhone({super.key});
  QRViewController? controllerPro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Page réservée au vendeur'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: Icon(
                    Icons.mobile_friendly,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Paiement',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Dossier ${AppStorage.readNumContrat()}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Choisissez le mode d'accès à la page de paiement pour le client",
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 15),
                Image.asset(
                  "assets/images/qr_code.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                  ),
                  onPressed: () async {
                    TaskInfo? taskInfo = await controller.getCurrentTask();
                    if (taskInfo != null &&
                        taskInfo.taskDefinitionKey == "Activity_0basjnn") {
                      print("Task Definition Key: Activity_0basjnn");

                      // Completing the task
                      await controller.completeTask(taskInfo.id, {
                        "tp": "qrcode",
                      });

                      // Camera control with null check
                      if (controllerPro != null && Platform.isAndroid) {
                        controllerPro!.pauseCamera();
                      }

                      if (controllerPro != null) {
                        controllerPro!.resumeCamera();
                      }

                      // Show success dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Succès'),
                            content: const Text(
                                'Le paiement a été effectué avec succès.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                  controller.startProcess("Process_7607");
                                  Get.to(PropositionFinancementScreen());
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      print(
                          "Task Definition Key does not match or taskInfo is null.");
                    }
                  },
                  child: const Text(
                    'QRCODE',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(
                  color: Colors.black,
                  height: 2,
                ),
                const SizedBox(height: 15),
                Image.asset(
                  "assets/images/sms_code.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                  ),
                  onPressed: () async {
                    TaskInfo? taskInfo = await controller.getCurrentTask();
                    if (taskInfo != null &&
                        taskInfo.taskDefinitionKey == "Activity_0basjnn") {
                      print("Task Definition Key: Activity_0basjnn");

                      // Completing the task
                      await controller.completeTask(taskInfo.id, {
                        "tp": "sms",
                      });

                      // Show success dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: const Text('Succès'),
                            content: const Text(
                                'Le paiement a été effectué avec succès.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(dialogContext).pop(); // Close the dialog
                                  controller.startProcess("Process_7607");
                                  Get.to(PropositionFinancementScreen());
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      print(
                          "Task Definition Key does not match or taskInfo is null.");
                    }
                  },
                  child: const Text(
                    'SMS',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
