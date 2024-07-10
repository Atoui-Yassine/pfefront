import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pfefront/core/storage/app_storage.dart';

class PageReserverAuVendeur extends StatelessWidget {
  const PageReserverAuVendeur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Page réservé au vendeur",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "Documents nécessaires pour le paiement",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Piéce d'identité en cours de validité à vérifier: \n",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/carte identite.png",
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        // text:
                        //     ,

                        children: [
                          TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                            text: "Emise par l'Union Européenne \n\n",
                            children: [
                              TextSpan(
                                text:
                                    " • Carte Nationale d'Identité*\n  • Passeport",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/carte bancaire.png",
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        // text:
                        //     ,

                        children: [
                          TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              //decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              //decorationStyle: TextDecorationStyle.solid,
                            ),
                            text:
                                "Carte bancaire Visa ou Mastercard\nVérifier que la carte bancaire du client :\n\n",
                            children: [
                              TextSpan(
                                text:
                                    "\t\t• Est strictement aux prénom/nom du client ",
                                children: [
                                  TextSpan(
                                    text:
                                        "\n\t\t• Possède une date d'expiration au-delà de ",
                                    children: [
                                      TextSpan(
                                        text: "${AppStorage.readDate()}",
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          //decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w500,
                                          //decorationStyle: TextDecorationStyle.solid,
                                        ),
                                      ),
                                      const TextSpan(
                                        text:
                                            " \n\t\t• N'est pas une carte à autorisation systématique du type Electron, Maestro, Nickel, ni une carte professionnelle ou commerciale.",
                                      )
                                    ],
                                  ),
                                ],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                style: TextStyle(
                    fontSize: 14,
                    //decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
                "*Pour la CNI : Date d'expiration tolérée fixée à + 5 ans maximum par rapport à la date imprimée, pour celles délivrées entre 2004 et 2013",
              ),
              const SizedBox(
                height: 8,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Prérequis à la souscription",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                style: TextStyle(
                  fontSize: 14,
                  //decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                  //decorationStyle: TextDecorationStyle.solid,
                ),
                "Avant de poursuivre le processus de souscription, vous devez apporter à votre client les informations liées à ses données personnelles et l'informer des justificatifs nécessaires à sa demande de financement.",
              ),
              const SizedBox(
                height: 8,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Informations données personnelles",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text.rich(
                TextSpan(
                    text:
                        "Vous devez informer votre client que des données à caractère personnel vont être collectées par CA CONSUMER FINANCE, en sa qualité de Responsable de traitement. Les informations demandées sont obligatoires et sont utilisées pour le traitement d'enregistrement de la simulation, la complétude du dossier, l'étude et l'octroi de sa demande de financement. Avec son accord, ses données pourront également être traitées à des fins de prospection commerciale. Le détail des modalités de traitement ainsi que des droits sont repris dans les dispositions que vous indiquez au client. (clic ci-dessous) Votre client doit prendre connaissance des dispositions relatives à la protection des données personnelles, cliquez ",
                    children: [
                      TextSpan(
                        text: "ici",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                height: 18,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20)),
                onPressed: () {
                  // if (controller.keyForm.currentState!.validate()) {
                  //   print('form valide');
                  // }
                },
                child: const Text(
                  "Continuer",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
