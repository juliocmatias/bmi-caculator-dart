class Person {
  String? _firstName;
  String? _lastName;
  double? _weight;
  double? _height;

  Person(String firstName, String lastName) {
    _validateName(firstName, 'Primeiro nome');
    _validateName(lastName, 'Sobrenome');
    _firstName = firstName;
    _lastName = lastName;
    _weight = 0;
    _height = 0;
  }

  void _validateName(String name, String fieldName) {
    if (name.isEmpty) {
      throw Exception('$fieldName não pode ser vazio');
    }
    if (name.length < 3) {
      throw Exception('$fieldName deve ter pelo menos 3 caracteres');
    }
  }

  String? get name => '$_firstName $_lastName';

  double get weight => _weight ?? 0;
  double get height => _height ?? 0;

  set weight(double weight) {
    if (weight <= 0) {
      throw Exception('O peso deve ser maior que 0!');
    }
    _weight = weight;
  }

  set height(double height) {
    if (height <= 0) {
      throw Exception('A altura deve ser maior que 0!');
    }
    _height = height;
  }

  @override
  String toString() {
    return {
      'firstName': _firstName,
      'lastName': _lastName,
      'weight': _weight,
      'height': _height
    }.toString();
  }
}
