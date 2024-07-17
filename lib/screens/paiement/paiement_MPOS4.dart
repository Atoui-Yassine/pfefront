import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Récapitulatif',
      home: RecapPage(),
    );
  }
}

class RecapPage extends StatefulWidget {
  @override
  _RecapPageState createState() => _RecapPageState();
}

class _RecapPageState extends State<RecapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page réservée au vendeur'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Récapitulatif de votre dossier',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            buildInfoRow('Référence dossier', '82008252646'),
            SizedBox(height: 10.0),
            buildInfoRow('Montant à financer', '1 000,00 €'),
            SizedBox(height: 10.0),
            buildInfoRow('Premier versement', '501,00 €'),
            SizedBox(height: 10.0),
            buildInfoRow('Deuxième versement', '499,00 €'),
            SizedBox(height: 40.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                  textStyle: TextStyle(fontSize: 18.0),
                ),
                child: Text('TERMINER'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}