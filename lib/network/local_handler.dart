import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool>? setBool({required String key, required bool value}) {
    return sharedPreferences!.setBool(key, value);
  }

  static getBool({required key}) {
    return sharedPreferences!.getBool(key);
  }
}
