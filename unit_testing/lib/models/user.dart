class User {
  final String name;
  final String email;

  const User({required this.email, required this.name});

  @override
  String toString() {
    return 'Name: $name, Email: $email';
  }
}
