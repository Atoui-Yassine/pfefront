import 'package:flutter/material.dart';

class ChoixModePaiment extends StatelessWidget {
  final String? numContrat;
  const ChoixModePaiment({super.key, this.numContrat});

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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                  const Spacer(),
                  Text(
                    '$numContrat',
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
              const Row(
                children: [
                  Text(
                    'Montant à financer',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '1 000,00 €',
                    style: TextStyle(
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
              const Row(
                children: [
                  Text(
                    '12/07/2024',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '09/08/2024',
                    style: TextStyle(
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
              const Row(
                children: [
                  Text(
                    '501,00 €',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '499,00 €',
                    style: TextStyle(
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
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                      ),
                      onPressed: () {
                        // Handle SMARTPHONE button press
                      },
                      child: const Text(
                        'SMARTPHONE',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20)),
                      onPressed: () {
                        // Handle SMARTPHONE button press
                      },
                      child: const Text(
                        'ENCAISS\'PHONE',
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const SizedBox(height: 16.0),
              const Text(
                'Un seul des trois boutons « TPE » ou « MPOS » ou « SMARTPHONE » sera affiché selon le mode de paiement que vous aurez choisi',
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
