import 'package:flutter/material.dart';

class CustomTranche extends StatelessWidget {
  final String? numTranche;
  final String? montant;
  const CustomTranche({super.key, this.numTranche, this.montant});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$numTranche',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          '$montant',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
