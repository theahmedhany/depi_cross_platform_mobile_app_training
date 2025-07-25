void main() {
  String name = "Ahmed";
  int age = 25;
  double height = 5.9;
  bool isStudent = true;
  List<String> hobbies = ["Reading", "Gaming"];
  Map<String, dynamic> profile = {
    "name": name,
    "age": age,
    "isStudent": isStudent,
  };

  String? nickname;
  print("Nickname: ${nickname ?? 'No nickname provided'}");
}
