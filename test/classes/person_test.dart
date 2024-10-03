import 'package:bmi_calculator/classes/person.dart';
import 'package:test/test.dart';

abstract class Ptest {
  static final String firstName = "Julio";
  static final String lastName = "Matias";
  static final double weight = 70.0;
  static final double height = 1.73;

  static String toTestString() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'weight': weight,
      'height': height
    }.toString();
  }
}

void main() {
  group('Testing Class Person', () {
    test("tests whether the class is created when passing correct parameters",
        () {
      Person p1 = Person(Ptest.firstName, Ptest.lastName);
      p1.height = Ptest.height;
      p1.weight = Ptest.weight;

      expect(p1.name, equals('${Ptest.firstName} ${Ptest.lastName}'));
      expect(p1.height, equals(Ptest.height));
      expect(p1.weight, equals(Ptest.weight));
      expect(p1.toString(), equals(Ptest.toTestString()));
    });

    test(
        "test if passing the first incorrect name throws an error with the correct message",
        () {
      expect(
          () => Person('', Ptest.lastName),
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString() == 'Exception: Primeiro nome não pode ser vazio')));
    });

    test(
        "test if passing a first name shorter than 3 characters throws an error with the correct message",
        () {
      // Verifica se a exceção contém a mensagem correta
      expect(
          () => Person('Ju', Ptest.lastName),
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString() ==
                  'Exception: Primeiro nome deve ter pelo menos 3 caracteres')));
    });

    test(
        "test if passing the last incorrect name throws an error with the correct message",
        () {
      expect(
          () => Person(Ptest.firstName, ''),
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString() == 'Exception: Sobrenome não pode ser vazio')));
    });

    test(
        "test if passing a last name shorter than 3 characters throws an error with the correct message",
        () {
      // Verifica se a exceção contém a mensagem correta
      expect(
          () => Person(Ptest.firstName, 'Ma'),
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString() ==
                  'Exception: Sobrenome deve ter pelo menos 3 caracteres')));
    });

    test(
        "test if passing a weight less than or equal to 0 throws an error with the correct message",
        () {
      Person p1 = Person(Ptest.firstName, Ptest.lastName);
      expect(
          () => p1.weight = 0,
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString() == 'Exception: O peso deve ser maior que 0!')));
    });

    test(
        "test if passing a height less than or equal to 0 throws an error with the correct message",
        () {
      Person p1 = Person(Ptest.firstName, Ptest.lastName);
      expect(
          () => p1.height = 0,
          throwsA(predicate((e) =>
              e is Exception &&
              e.toString() == 'Exception: A altura deve ser maior que 0!')));
    });
  });
}
