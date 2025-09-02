import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_model.dart';

class HiveService {
  static const String _userBoxName = 'userBox';
  static const String _userKey = 'currentUser';

  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox<UserModel>(_userBoxName);
  }

  static Box<UserModel> get _userBox => Hive.box<UserModel>(_userBoxName);

  static Future<void> saveUser(UserModel user) async {
    await _userBox.put(_userKey, user);
  }

  static UserModel? getUser() {
    return _userBox.get(_userKey);
  }

  static Future<void> updateUser(UserModel user) async {
    await _userBox.put(_userKey, user);
  }

  static Future<void> clearUser() async {
    await _userBox.delete(_userKey);
  }

  static bool hasUser() {
    return _userBox.containsKey(_userKey);
  }

  static Future<void> closeBoxes() async {
    await Hive.close();
  }
}
