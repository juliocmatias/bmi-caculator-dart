import 'dart:math';

abstract class Bmi {
  static double calculateBMI(double weight, double height) {
    return weight / pow(height /100 , 2);
  }

  static String classification(double bmi) {
    switch (bmi) {
      case < 16:
        return 'Magreza Grave';
      case == 16 || < 17:
        return 'Magreza moderada';
      case == 17 || < 18.5:
        return 'Magreza leve'; 
      case == 18.5 || < 25:
        return 'Saudável';
      case == 25 || < 30:
        return 'Sobrepeso';
      case == 30 || < 35:
        return 'Obsidade Grau I';
      case == 35 || < 40:
        return 'Obsidade Grau II (severa)';
      default:
      return 'Obsidade Grau III (morbida)';
    }
  }
}