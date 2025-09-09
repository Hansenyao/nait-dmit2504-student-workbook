class Word {
  late String name;
  late String definition;

  Word({required this.name, required this.definition});
  
  factory Word.fromJson(dynamic json) {
    return Word(name: json[0]['word'], definition: json[0]['meanings'][0]['definitions'][0]['definition']);
  }

  @override
  String toString() {
    return '$name\t\t\t\t$definition';
  }
}