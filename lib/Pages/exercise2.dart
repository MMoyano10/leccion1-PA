import 'package:flutter/material.dart';
import 'dart:math';

class Exercise2Screen extends StatefulWidget {
  @override
  _Exercise2ScreenState createState() => _Exercise2ScreenState();
}

class _Exercise2ScreenState extends State<Exercise2Screen> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = "";
  bool _isUsingRadius = true;

  void _calculateAreaAndVolume() {
    double input = double.tryParse(_inputController.text) ?? 0.0;
    double height = double.tryParse(_heightController.text) ?? 0.0;

    if (input <= 0 || height <= 0) {
      setState(() {
        _result = "Por favor, ingrese valores válidos mayores a 0.";
      });
      return;
    }

    double radius = _isUsingRadius ? input : input / 2;
    double areaBasal = pi * pow(radius, 2); // Área basal
    double volume = areaBasal * height; // Volumen del cilindro

    setState(() {
      _result =
      "Área Basal: ${areaBasal.toStringAsFixed(2)}\nVolumen: ${volume.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicio 2: Área y Volumen de Cilindro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Seleccione si desea calcular usando el radio o el diámetro:',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: _isUsingRadius,
                  onChanged: (value) {
                    setState(() {
                      _isUsingRadius = value!;
                    });
                  },
                ),
                Text('Radio'),
                SizedBox(width: 20),
                Radio<bool>(
                  value: false,
                  groupValue: _isUsingRadius,
                  onChanged: (value) {
                    setState(() {
                      _isUsingRadius = value!;
                    });
                  },
                ),
                Text('Diámetro'),
              ],
            ),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: _isUsingRadius ? 'Ingrese el radio' : 'Ingrese el diámetro',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese la altura',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateAreaAndVolume,
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
