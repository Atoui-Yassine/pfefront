import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfefront/controllers/TaskInfo%20.dart';
import 'package:pfefront/controllers/home_controller.dart';
import 'package:pfefront/core/storage/app_storage.dart';
import 'package:pfefront/core/widgets/custom_row_paiement.dart';
import 'package:pfefront/screens/home/proposition_financement_screen.dart';
import 'package:pfefront/screens/paiement/paiement_smart_phone.dart';

class ChoixModePaiment extends GetView<HomeController> {
  final String? totale;
  final Widget? widget;

  const ChoixModePaiment({
    super.key,
    this.totale,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paiement',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // Handle close button press
            },
          ),
        ],
      ),
      body: Container(
        // Add background image to the page
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Image.asset(
                "assets/images/paiement.png",
                width: 300,
                height: 200,
              ),
              const SizedBox(height: 16.0),
              const Center(
                child: Text(
                  'Cliquer sur le bouton du mode de paiement souhaité',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Text(
                    'Numéro de dossier',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '${AppStorage.readNumContrat()}',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Divider(
                color: Colors.black,
                height: 2,
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  const Text(
                    'Montant à financer',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '$totale',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              widget ?? const SizedBox.shrink(),
              const SizedBox(height: 8.0),
              const Divider(
                color: Colors.black,
                height: 2,
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                          taskInfo.taskDefinitionKey == "Activity_0kf1pkx") {
                        print("Task Definition Key: Activity_0kf1pkx");
                        await controller.completeTask(taskInfo.id, {
                          "mp": "phone",
                        });
                        Get.to(PaymentSmartPhone());
                      } else {
                        print(
                            "Task Definition Key does not match or taskInfo is null.");
                      }
                    },
                    child: const Text(
                      'SMARTPHONE',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
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
                          taskInfo.taskDefinitionKey == "Activity_0kf1pkx") {
                        print("Task Definition Key: Activity_0kf1pkx");

                        // Show custom dialog before completing task
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext dialogContext) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              title: const Text(
                                'Procéder au paiement',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.phone_android,
                                    size: 50,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Veuillez disposer votre téléphone pour procéder au paiement via Encaiss\'Phone.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50,
                                        vertical: 15,
                                      ),
                                    ),
                                    onPressed: () async {
                                      // Complete the task after user confirmation
                                       // Close the dialog
                                      Navigator.of(dialogContext).pop();
                                          
                                           await controller.completeTask(taskInfo.id, {
                                        "mp": "encaiss_phone",
                                      });
                                        await Future.delayed(const Duration(milliseconds: 200));
                                      // Show success dialog
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Succès'),
                                            content: const Text(
                                                'Le paiement a été effectué avec succès.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(); // Close success dialog
                                                  controller.startProcess("Process_7607");
                                                      
                                                  Get.to(
                                                      PropositionFinancementScreen());
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text(
                                      'Confirmer',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        print(
                            "Task Definition Key does not match or taskInfo is null.");
                      }
                    },
                    child: const Text(
                      'ENCAISS\'PHONE',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Un seul des deux boutons « ENCAISS\'PHONE » ou « SMARTPHONE » sera affiché selon le mode de paiement que vous aurez choisi',
                style: TextStyle(fontSize: 16.0, color: Colors.red),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
