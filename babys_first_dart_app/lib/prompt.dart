import 'dart:ffi';
import 'dart:io';

String promptForName() {
  stdout.writeln('What is your name?');
  return stdin.readLineSync() ?? '';
}

double promptForRadius() {
  stdout.writeln('What is the radius of your circle?');
  return double.parse(stdin.readLineSync()!);
}

double calculateArea(double radius) {
  return 3.1415*radius*radius;
}

String prompt(String message) {
  stdout.writeln(message);
  return stdin.readLineSync() ?? '';
}

int promptInt(String message) {
  bool isValid = false;

  while (!isValid) {
    String input = prompt(message);
    try {
      return int.parse(input);
    }
    catch (e) {
      stdout.writeln('Invalid value! Please enter again!');
    }
  }
}