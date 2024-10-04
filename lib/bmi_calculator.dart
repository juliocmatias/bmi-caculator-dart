import 'package:bmi_calculator/classes/bmi.dart';
import 'package:bmi_calculator/classes/console.dart';
import 'package:bmi_calculator/models/person.dart';

Person? validateInputsName(String firstName, String lastName) {
  try {
    Person p = Person(firstName, lastName);
    return p;
  } on Exception catch (e) {
    clearConsole();
    print('$e');
    print('tente novamente...');
    return null;
  }
}

// clear console window using sequence ANSI;
void clearConsole() {
  print("\x1B[2J\x1B[0;0H");
}

double readValidDoubleInput(Person person, String type, String message) {
  double? input;
  do {
    try {
      input = Console.readDoubleConsoleWithMesseger(message);
      switch (type) {
        case 'weight':
          person.weight = input;
          break;
        case 'height':
          person.height = input;
          break;
        default:
          return input;
      }
    } on Exception catch (e) {
      clearConsole();
      print('$e');
      print('Tente novamente...');
      input = null;
    }
  } while (input == null);
  return input;
}

void execute() {
  clearConsole();
  print('Seja bem vindo!\nVamos calcular seu IMC!');

  String? exit;

  do {
    Person? person;

    do {
      String firstName =
          Console.readConsoleWithMesseger('Digite seu nome:').trim();
      String lastName =
          Console.readConsoleWithMesseger('Digite seu sobrenome:').trim();
      person = validateInputsName(firstName, lastName);
    } while (person == null);

    clearConsole();
    print('Olá ${person.name}!');

    readValidDoubleInput(person, 'weight', 'Digite seu peso:\nex: 70');

    clearConsole();

    readValidDoubleInput(person, 'height', 'Digite sua altura em cm:\nex: 173');

    double bmi = Bmi.calculateBMI(person.weight, person.height);
    String classification = Bmi.classification(bmi);
    print('-------------Resultado---------------');
    print('Nome: ${person.name}');
    print('Peso: ${person.weight}');
    print('Altura: ${person.height}');
    print('IMC: $bmi');
    print('Classificação: $classification');

    exit = Console.readConsoleWithMesseger(
        'Digite "X" para encerrar ou enter para verificar outra pessoa.').toUpperCase();
  } while (exit != 'X');
}
