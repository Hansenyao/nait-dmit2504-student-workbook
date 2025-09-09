import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dart_futures_exercise/modules/word.dart';

void main(List<String> arguments) async {
  const String baseUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/';

  while (true) {
    print('\nPlease enter your world: ');
    var wordString = stdin.readLineSync();
    
    try {
      var json = await getJson('$baseUrl$wordString');
      var word = Word.fromJson(json);

      print('\nWord\t\t\t\tDefinition');
      print('-------------------------------\t------------------------');
      print(word);
      print('\n');
    } catch (e) {
      throw Exception('There was an error with the request: ${e.toString()}');
    }

    print('Would you want to continue? ');
    var option = stdin.readLineSync();
    if (option != 'y' && option != 'Y') break;
  }
}

Future<dynamic> getJson(String endpoint) async {
  var uri = Uri.parse(endpoint);  // Create the URI Object from the string
  var response = await http.get(uri); // Make the http request
  return jsonDecode(response.body);
}