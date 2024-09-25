import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfefront/controllers/TaskInfo%20.dart';
import 'package:pfefront/controllers/home_controller.dart';
import 'package:pfefront/core/widgets/custom_drop_dow_button.dart';
import 'package:pfefront/screens/page_inscription_2.dart';

class PageInscription1 extends GetView<HomeController> {
  final String? totale;
  final int nbrTranche;
  
  const PageInscription1({
    super.key,
    this.totale,
    required this.nbrTranche,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Page d'échange client / vendeur",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
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
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[150],
                      radius: 25,
                      child: const Text(
                        "1",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Pièces justificatives",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  "Choisissez un type de pièce : Justificatif d'identité",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return CustomDropDowButton(
                      backgroundColor: Colors.grey[200],
                      hintText: "Choisir",
                      selectedValue: controller.selectedValueMaritalStatus,
                      list: controller.listCarte,
                      onChanged: (p0) =>
                          controller.onChnagedDropDownMaritalStatus(p0!),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[150],
                      radius: 25,
                      child: const Text(
                        "2",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Prendre vos photos",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                const Text(
                  "Prendre en photo, dans la vignette du haut, en mode paysage, la face sur laquelle figure la piste MRZ \nAssurez-vous qu'elle soit NETTE et SANS REFLET",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Face 1",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 10),
                GetBuilder<HomeController>(
                  builder: (controller) => InkWell(
                    child: controller.image != null
                        ? Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(controller.image!),
                              ),
                            ),
                          )
                        : Container(
                            width: 200,
                            height: 100,
                            color: Colors.grey[200],
                            child: const Center(child: Text('prendre un photo')),
                          ),
                    onTap: () {
                      controller.showOptions(context, 1);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Face 2",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 10),
                GetBuilder<HomeController>(
                  builder: (controller) => InkWell(
                    child: controller.imageFace2 != null
                        ? Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(controller.imageFace2!),
                              ),
                            ),
                          )
                        : Container(
                            width: 200,
                            height: 100,
                            color: Colors.grey[200],
                            child: const Center(child: Text('prendre un photo')),
                          ),
                    onTap: () {
                      controller.showOptions(context, 2);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 20,
                    ),
                  ),
                  onPressed: () async {
                    TaskInfo? taskInfo = await controller.getCurrentTask();
                    if (taskInfo != null &&
                        taskInfo.taskDefinitionKey == "Activity_040odqc") {
                      await controller.completeTask(taskInfo.id, {
                        "path1": controller.image!.path,
                        "path2": controller.imageFace2!.path,
                      });
                      Get.to(PageInscription2(
                        totale: totale,
                        nbrTranche: nbrTranche,
                      ));
                    } else {
                      print(
                          "Task Definition Key does not match or taskInfo is null.");
                    }
                  },
                  child: const Text(
                    "Valider",
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
        ),
      ),
    );
  }
}
