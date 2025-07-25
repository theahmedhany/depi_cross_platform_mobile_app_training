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
