import 'package:flutter/material.dart';
import 'Pages/exercise1.dart';
import 'Pages/exercise2.dart';
import 'Pages/exercise3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lección Práctica',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/exercise1': (context) => Exercise1Screen(),
        '/exercise2': (context) => Exercise2Screen(),
        '/exercise3': (context) => Exercise3Screen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lección Práctica')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Seleccione un ejercicio:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/exercise1'),
              child: Text('Ejercicio 1: Longitud de Circunferencia'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/exercise2'),
              child: Text('Ejercicio 2: Área y Volumen de Cilindro'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/exercise3'),
              child: Text('Ejercicio 3: Hipotenusa'),
            ),
          ],
        ),
      ),
    );
  }
}
