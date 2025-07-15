/*

🧩 Task 8: Multiple Mixins
  Create two mixins Logger and Saver.
  Create a class App that mixes both and calls methods from both mixins.

*/

mixin Logger {
  void log() => print('Logging...');
}

mixin Saver {
  void save() => print('Saving...');
}

class App with Logger, Saver {}

void main() {
  App app = App();
  app.log();
  app.save();
}
