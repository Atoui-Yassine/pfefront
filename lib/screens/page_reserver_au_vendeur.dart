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
      body: Padding(
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
          ],
        ),
      ),
    );
  }
}
