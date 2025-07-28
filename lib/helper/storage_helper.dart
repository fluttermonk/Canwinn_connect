import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static SharedPreferences? _preferences;

  static Future<void> initialize() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<void> clear() async => await _preferences?.clear();

  static const String _token = "token";
  static const String _userId = "user_id";
  static const String _userName = "user_name";
  static const String _userEmail = "user_email";
  static const String _userPhone = "user_phone";
  static const String _userActive = "user_active";
  static const String _userCreated = "user_created_at";
  static const String _userUpdated = "user_updated_at";

  static Future<void> saveUserData(Map<String, dynamic> data) async {
    final user = data['user'];

    await _preferences?.setString(_token, data['token'] ?? '');
    await _preferences?.setInt(_userId, user['id'] ?? 0);
    await _preferences?.setString(_userName, user['name'] ?? '');
    await _preferences?.setString(_userEmail, user['email'] ?? '');
    await _preferences?.setString(_userPhone, user['phone_number'] ?? '');
    await _preferences?.setBool(_userActive, user['is_active'] ?? false);
    await _preferences?.setString(_userCreated, user['created_at'] ?? '');
    await _preferences?.setString(_userUpdated, user['updated_at'] ?? '');
  }

  static String? getToken() => _preferences?.getString(_token);
  static int? getUserId() => _preferences?.getInt(_userId);
  static String? getUserName() => _preferences?.getString(_userName);
  static String? getUserEmail() => _preferences?.getString(_userEmail);
  static String? getUserPhone() => _preferences?.getString(_userPhone);
  static bool? isUserActive() => _preferences?.getBool(_userActive);
  static String? getUserCreatedAt() => _preferences?.getString(_userCreated);
  static String? getUserUpdatedAt() => _preferences?.getString(_userUpdated);
}
