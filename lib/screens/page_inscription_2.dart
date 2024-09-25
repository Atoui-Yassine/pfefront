import 'package:country_picker/country_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfefront/controllers/TaskInfo%20.dart';
import 'package:pfefront/controllers/home_controller.dart';
import 'package:pfefront/core/storage/app_storage.dart';
import 'package:pfefront/core/widgets/custom_row_paiement.dart';
import 'package:pfefront/screens/home/proposition_financement_screen.dart';
import 'package:pfefront/screens/paiement/choix_mode_paiement.dart';

class PageInscription2 extends GetView<HomeController> {
  final String? totale;
  final int nbrTranche;

  const PageInscription2({
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
          icon: const Icon(
            Icons.arrow_back,
          ),
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: controller.keyFormInscrip,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Verifiez et completer vos données personnelles",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 25),
                  GetBuilder<HomeController>(
                    builder: (controller) => DropdownButton(
                      hint: const Text("civility title"),
                      value: controller.selectedValueCivilityTitle,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      items: controller.civilityTitle.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.onChnagedDropDownCivilityTitle(value!);
                      },
                    ),
                  ),
                  TextFormField(
                    controller: controller.nomController,
                    decoration: const InputDecoration(
                      label: Text("Nom"),
                      hintText: "tapez votre nom",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre nom";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Nom de naissance (Facultatif)"),
                      hintText: "ex: Dupant",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: controller.prenomController,
                    decoration: const InputDecoration(
                      label: Text("Prenom"),
                      hintText: "tapez votre prénom",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre prénom";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Date de naissance"),
                      hintText: "tapez votre date de naissance",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre date de naissance";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Code postale de naissance"),
                      hintText: "tapez votre code postal de naissance",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre code postal";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Nationalité"),
                      hintText: "tapez votre nationalité",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre nationalité";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Ville de naissance"),
                      hintText: "tapez votre ville de naissance",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.villa,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre ville de naissance";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  GetBuilder<HomeController>(
                    builder: (controller) => TextFormField(
                      readOnly: true,
                      onTap: () => showCountryPicker(
                        context: context,
                        useSafeArea: true,
                        exclude: <String>['KN', 'MF'],
                        favorite: <String>['SE'],
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          controller.selectCountry(
                            country.displayNameNoCountryCode,
                          );
                        },
                        moveAlongWithKeyboard: false,
                        countryListTheme: CountryListThemeData(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                          inputDecoration: InputDecoration(
                            labelText: 'Rechercher',
                            hintText: 'Commencez à taper',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                            ),
                          ),
                          searchTextStyle: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      controller: controller.countryControllerController,
                      decoration: const InputDecoration(
                        label: Text("Pays de naissance"),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.villa,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Adresse Postale"),
                      hintText: "tapez votre adresse postale",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.villa,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre adresse postale";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      label: Text("Email du Client"),
                      hintText: "tapez votre email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre email";
                      } else if (!EmailValidator.validate(value)) {
                        return "Entrez un email valide";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Téléphone"),
                      hintText: "tapez votre numéro de téléphone",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez entrer votre numéro de téléphone";
                      } else if (value.length < 8) {
                        return "Entrez un numéro de téléphone valide";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Recevoir par voie électronique des offres commerciales du prêteur CA",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GetBuilder<HomeController>(
                    builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: controller.isCheckedYes,
                            onChanged: (value) =>
                                controller.handleYesChecked(value!),
                          ),
                          const Text(
                            'Oui',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 20.0),
                          Checkbox(
                            value: controller.isCheckedNo,
                            onChanged: (value) =>
                                controller.handleNoChecked(value!),
                          ),
                          const Text(
                            'Non',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 20,
                      ),
                    ),
                    onPressed: () async {
                      if (controller.keyFormInscrip.currentState!.validate()) {
                        controller.getContrat();
                        print('Form validé');
                        TaskInfo? taskInfo =
                            await controller.getCurrentTask();
                        if (taskInfo != null &&
                            taskInfo.taskDefinitionKey == "Activity_08psjmn") {
                          await controller.completeTask(taskInfo.id, {
                            "email": controller.emailController.text,
                            "nom": controller.nomController.text,
                            "prenom": controller.prenomController.text,
                          });
                          if (controller.emailController.text != null) {
                            Get.to(
                              ChoixModePaiment(
                                totale: totale,
                                widget: nbrTranche == 2
                                    ? Column(
                                        children: [
                                          CustomRowPaiement(
                                            date: AppStorage.readDate1(),
                                            montant: AppStorage.readMontant1(),
                                          ),
                                          CustomRowPaiement(
                                            date: AppStorage.readDate2(),
                                            montant: AppStorage.readMontant2(),
                                          ),
                                        ],
                                      )
                                    : nbrTranche == 3
                                        ? Column(
                                            children: [
                                              CustomRowPaiement(
                                                date:
                                                    AppStorage.readDate1(),
                                                montant:
                                                    AppStorage.readMontant1(),
                                              ),
                                              CustomRowPaiement(
                                                date:
                                                    AppStorage.readDate2(),
                                                montant:
                                                    AppStorage.readMontant2(),
                                              ),
                                              CustomRowPaiement(
                                                date:
                                                    AppStorage.readDate3(),
                                                montant:
                                                    AppStorage.readMontant3(),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              CustomRowPaiement(
                                                date:
                                                    AppStorage.readDate1(),
                                                montant:
                                                    AppStorage.readMontant1(),
                                              ),
                                              CustomRowPaiement(
                                                date:
                                                    AppStorage.readDate2(),
                                                montant:
                                                    AppStorage.readMontant2(),
                                              ),
                                              CustomRowPaiement(
                                                date:
                                                    AppStorage.readDate3(),
                                                montant:
                                                    AppStorage.readMontant3(),
                                              ),
                                              CustomRowPaiement(
                                                date:
                                                    AppStorage.readDate4(),
                                                montant:
                                                    AppStorage.readMontant4(),
                                              ),
                                            ],
                                          ),
                              ),
                            );
                          } else {
                            controller.startProcess("Process_7607");
                            Get.to(PropositionFinancementScreen());
                          }
                        } else {
                          print(
                              "Task Definition Key does not match or taskInfo is null.");
                        }
                      }
                    },
                    child: const Text(
                      "Je valide mes données et choix",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
