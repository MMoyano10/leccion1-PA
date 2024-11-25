import 'package:flutter/material.dart';
import 'dart:math';

class Exercise1Screen extends StatefulWidget {
  @override
  _Exercise1ScreenState createState() => _Exercise1ScreenState();
}

class _Exercise1ScreenState extends State<Exercise1Screen> {
  final TextEditingController _inputController = TextEditingController();
  String _result = "";
  bool _isUsingRadius = true;

  void _calculateCircumference() {
    double input = double.tryParse(_inputController.text) ?? 0.0;

    if (input <= 0) {
      setState(() {
        _result = "Por favor, ingrese un valor válido mayor a 0.";
      });
      return;
    }

    double circumference;
    if (_isUsingRadius) {
      circumference = 2 * pi * input; // Cálculo usando radio
    } else {
      circumference = pi * input; // Cálculo usando diámetro
    }

    setState(() {
      _result = "La longitud de la circunferencia es: ${circumference.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicio 1: Longitud de Circunferencia')),
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
            ElevatedButton(
              onPressed: _calculateCircumference,
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
