class Student {
  // Properties
  late String _firstName; // The underscore makes it private
  late String _lastName;
  late int _idNumber;

  // Constructors
  Student({
    required String firstName, 
    required String lastName, 
    required idNumber
  }) {
    this.firtName = firstName;
    this.lastName = lastName;
    this.idNumber = idNumber;
  }
  Student.emptyStudent() {
    _firstName = '';
    _lastName = '';
    _idNumber = 0;
  }
  Student.copyFromStudent(Student other) {
    _firstName = other.firstName;
    _lastName = other.lastName;
    _idNumber = other.idNumber;
  }

  String get firstName {
    return _firstName;
  }
  set firtName(String value) {
    // Validate that it is at least 1 character
    if (value.isEmpty) {
      throw Exception('First name must be at least 1 character');
    }
    _firstName = value;
  }

  String get lastName {
    return _lastName;
  }
  set lastName(String value) {
    // Validate that it is at least 1 character
    if (value.isEmpty) {
      throw Exception('Last name must be at least 1 character');
    }
    _lastName = value;
  }

  int get idNumber {
    return _idNumber;
  }
  set idNumber(int value) {
    _idNumber = value;
  }
}

