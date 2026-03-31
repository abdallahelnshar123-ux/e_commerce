import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {
  static late SharedPreferences sharedPreferences;

  static Future<SharedPreferences> init() async {
   return  sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    switch (value) {
      case int _:
        return sharedPreferences.setInt(key, value);
      case String _:
        return sharedPreferences.setString(key, value);
      case double _:
        return sharedPreferences.setDouble(key, value);
      case List<String> _:
        return sharedPreferences.setStringList(key, value);
      default:
        return sharedPreferences.setBool(key, value);
    }
  }

  static Object? getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key})async {
    return await sharedPreferences.remove(key);
  }
}

class ShredPrefsKeys{
  static const String tokenKey = 'token' ;

}