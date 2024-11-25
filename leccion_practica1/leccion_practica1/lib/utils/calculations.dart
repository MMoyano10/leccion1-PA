import 'dart:math';

double calculateCircumferenceByRadius(double radius) {
  if (radius <= 0) throw ArgumentError('El radio debe ser positivo.');
  return 2 * 3.1416 * radius;
}

double calculateCircumferenceByDiameter(double diameter) {
  if (diameter <= 0) throw ArgumentError('El diámetro debe ser positivo.');
  return 3.1416 * diameter;
}

double calculateCylinderArea(double radius) {
  if (radius <= 0) throw ArgumentError('El radio debe ser positivo.');
  return 3.1416 * radius * radius;
}

double calculateCylinderVolume(double radius, double height) {
  if (radius <= 0 || height <= 0) {
    throw ArgumentError('Radio y altura deben ser positivos.');
  }
  return calculateCylinderArea(radius) * height;
}

double calculateHypotenuse(double a, double b) {
  if (a <= 0 || b <= 0) throw ArgumentError('Los lados deben ser positivos.');
  return sqrt(a * a + b * b);
}

