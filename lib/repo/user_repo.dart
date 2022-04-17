import 'package:shared_preferences/shared_preferences.dart';

class UserRepo {
  final String _userIdKey = 'userId';

  Future<void> saveUserId(String id) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(_userIdKey, id);
  }

  Future<void> removeUserId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.remove(_userIdKey);
  }

  Future<String> getUserId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_userIdKey) ?? '';
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.containsKey(_userIdKey);
  }
}
