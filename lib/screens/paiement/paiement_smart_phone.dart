import 'package:flutter/material.dart';
import 'package:pfefront/core/storage/app_storage.dart';

class PaymentSmartPhone extends StatelessWidget {
  const PaymentSmartPhone({super.key});

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
      body: SingleChildScrollView(
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
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Choisissez le mode d'acces à la page de paiment pour le client",
                style: TextStyle(color: Colors.red),
              ),
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                "assets/images/qr_code.png",
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
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
                  'QRCODE',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: Colors.black,
                height: 2,
              ),
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                "assets/images/sms_code.png",
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
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
