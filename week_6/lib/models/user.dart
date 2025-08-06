class User {
  final String name;
  final String email;
  final String phone;

  User({required this.name, required this.email, required this.phone});

  @override
  String toString() {
    return 'User{name: $name, email: $email, phone: $phone}';
  }
}
