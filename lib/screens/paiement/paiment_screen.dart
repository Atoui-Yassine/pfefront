import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  runApp(const PaymentApp());
}

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Payment Interface',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  String? _selectedMonth;
  String? _selectedYear;

  final List<String> _months = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];

  final List<String> _years = [
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031',
    '2032'
  ];

  void _processPayment() {
    // Dummy implementation for processing payment
    String cardNumber = _cardNumberController.text;
    String expiryDate =
        '$_selectedMonth/$_selectedYear'; // Combine selected month and year

    // Perform payment processing logic here (e.g., validate inputs, call API, etc.)

    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Confirmation'),
          content: Text('Payment successful!\nExpiry Date: $expiryDate'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  final keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text('Payment Interface'),
      ),
      body: (
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 30.0),
              TextFormField(
                controller: _cardNumberController,
                validator: (value) {
                  if (value!.isEmpty && value.length < 16) {
                    return "enter a valide card number ";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Card Number',
                    prefixIcon: Icon(Icons.credit_card)),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  DropdownButton<String>(
                    icon: const Icon(Icons.date_range),
                    hint: const Text('MM'),
                    value: _selectedMonth,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedMonth = newValue!;
                      });
                    },
                    items:
                        _months.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(width: 18.0),
                  DropdownButton<String>(
                    icon: const Icon(Icons.date_range),
                    hint: const Text('YY'),
                    value: _selectedYear,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedYear = newValue!;
                      });
                    },
                    items: _years.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty && value.length != 3) {
                    return "enter a valide cvv";
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'CVV',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20)),
                onPressed: () {
                  if (keyForm.currentState!.validate()) {
                    print('form valide');
                    // print(
                    //     'email===========>${controller.emailController.text}');
                    // controller.login();
                  }
                },
                child: const Text(
                  "Make Payment",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
