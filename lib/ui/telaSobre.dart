import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Desenvolvedores do aplicativo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Desenvolvedor 1: João Victor Nunnes',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Idade: 21 anos',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Desenvolvedor 2: Lucas Moura',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Idade: 32 anos',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Desenvolvedor 2: Rafael Borba',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Idade: 33 anos',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
