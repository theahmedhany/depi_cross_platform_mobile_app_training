class User {
  final String name;
  final String position;
  final String image;
  final String email;
  final String status;

  User({
    required this.name,
    required this.position,
    required this.image,
    required this.email,
    required this.status,
  });

  factory User.fromMap(Map<String, String> map) {
    return User(
      name: map['name'] ?? '',
      position: map['position'] ?? '',
      image: map['image'] ?? '',
      email: map['email'] ?? '',
      status: map['status'] ?? 'offline',
    );
  }
}
