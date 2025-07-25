class InvalidAgeException implements Exception {
  String errorMessage() => "Age must be 18 or older.";
}

void checkAge(int age) {
  if (age < 18) {
    throw InvalidAgeException();
  } else {
    print("Access granted. Age is valid.");
  }
}

void main() {
  try {
    checkAge(16);
  } catch (e) {
    print(e is InvalidAgeException ? e.errorMessage() : "Unknown error");
  }
}
