import 'package:flutter/material.dart';

class CustomRowPaiement extends StatelessWidget {
  final String? date;
  final String? montant;
  const CustomRowPaiement({super.key, this.date, this.montant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.black,
          height: 2,
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Text(
              date!,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const Spacer(),
            Text(
              '$montant dt',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
