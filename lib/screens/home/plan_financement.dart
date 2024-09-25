import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfefront/controllers/TaskInfo%20.dart';
import 'package:pfefront/controllers/home_controller.dart';
import 'package:pfefront/screens/page_inscription_1.dart';

class PlanFinancement extends StatelessWidget {
  final String? montantPremierTranche;
  final String? date;
  final String? total;
  final Widget? widget;
  final int nbrTranche;
   
  // Controller instance
  final HomeController homeController = Get.put(HomeController());

  PlanFinancement({
    super.key,
    this.montantPremierTranche,
    this.date,
    this.total,
    this.widget,
    required this.nbrTranche,
  });

  @override
  Widget build(BuildContext context) {
    
     
      homeController.creatContrat(date.toString(), nbrTranche); 
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.blue,
        title: const Text(
          "Plan de financements",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        // Background image container
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 35),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Veuillez confirmer les conditions du paiement',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Versement du premier paiement comptant',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                montantPremierTranche ?? "N/A", // Handle null safety
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('le ${date ?? "N/A"}'), // Handle null safety
                          const SizedBox(height: 16),
                          widget ?? const SizedBox.shrink(), // Handle null safety
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Text(
                                'TOTAL',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                total ?? "N/A", // Handle null safety
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 20,
                        ),
                      ),
                      onPressed: () async {
                        TaskInfo? taskInfo = await homeController.getCurrentTask();
                        if (taskInfo != null &&
                            taskInfo.taskDefinitionKey == "Activity_025xr78") {
                          print("Task Definition Key: Activity_025xr78");

                          await homeController.completeTask(taskInfo.id, {
                            "plant": "test", // Example parameter, can be set to "" if not needed
                          });

                          
                          Get.to(
                            PageInscription1(
                              totale: total ?? "0", // Handle null safety
                              nbrTranche: nbrTranche,
                            ),
                          );
                        } else {
                          print("Task Definition Key does not match or taskInfo is null.");
                        }
                      },
                      child: const Text(
                        "Confirmer",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
