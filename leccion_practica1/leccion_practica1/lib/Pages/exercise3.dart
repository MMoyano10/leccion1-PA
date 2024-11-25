import 'package:flutter/material.dart';
import 'dart:math';

class Exercise3Screen extends StatefulWidget {
  @override
  _Exercise3ScreenState createState() => _Exercise3ScreenState();
}

class _Exercise3ScreenState extends State<Exercise3Screen> {
  final TextEditingController _cateto1Controller = TextEditingController();
  final TextEditingController _cateto2Controller = TextEditingController();
  String _result = "";

  void _calculateHypotenuse() {
    double cateto1 = double.tryParse(_cateto1Controller.text) ?? 0.0;
    double cateto2 = double.tryParse(_cateto2Controller.text) ?? 0.0;

    if (cateto1 <= 0 || cateto2 <= 0) {
      setState(() {
        _result = "Por favor, ingrese valores válidos mayores a 0.";
      });
      return;
    }

    double hypotenuse = sqrt(pow(cateto1, 2) + pow(cateto2, 2));

    setState(() {
      _result = "La longitud de la hipotenusa es: ${hypotenuse.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicio 3: Hipotenusa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ingrese los valores de los catetos para calcular la hipotenusa:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _cateto1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cateto 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _cateto2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cateto 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateHypotenuse,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
