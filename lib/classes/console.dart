
import 'dart:convert';
import 'dart:io';

abstract class Console {
  static String readConsole() => stdin.readLineSync(encoding: utf8) ?? "";

  static String readConsoleWithMesseger(String message) {
    print(message);
    return readConsole();
  }

  static double readDoubleInConsole() {
    var value = readConsole();
    return double.tryParse(value) ?? 0;
  }

  static double readDoubleConsoleWithMesseger(String message) {
    print(message);
    return readDoubleInConsole();
  }

}