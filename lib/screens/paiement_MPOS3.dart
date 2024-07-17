import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '21:32',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Page d\'échange client / vendeur',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Ticket CB',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '82008252646☑',/// ajouter l'id du contrat
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Le ticket de caisse vient d\'être envoyé par email à votre client',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Vous pouvez le visualiser ci-dessous',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'CARTE BANCAIRE',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'A0000000421010',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'CB COMPTANT',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Le 08/03/2021 A 10:08:56',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'MONTANT :',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'DEBIT 240,81 EUR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'TICKET CLIENT',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'A CONSERVER',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'MERCI AU REVOIR',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Numéro d\'autorisation 123456',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Ticket CB',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Date d\'expiration de la carte bancaire 12/2030',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'DEMO G SUIVANT',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}