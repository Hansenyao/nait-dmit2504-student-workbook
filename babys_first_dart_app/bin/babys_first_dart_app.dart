import 'dart:io';
import 'package:babys_first_dart_app/babys_first_dart_app.dart' as babys_first_dart_app;
import 'package:babys_first_dart_app/prompt.dart' as prompt;

void main(List<String> arguments) {
  print('Hello world: ${babys_first_dart_app.calculate()}!\n');

  var x = prompt.promptForName();
  stdout.writeln('Hello $x!: ${babys_first_dart_app.calculate()}!\n');

  var radius = prompt.promptForRadius();
  stdout.writeln('Your circle has an area of ${prompt.calculateArea(radius)}\n');
}
