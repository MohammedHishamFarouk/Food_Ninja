import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //here we initialize the cache
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // this method is used to put data inside the local database using a key
  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //this method is used to put data in local database using key
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  //this method is used to get data from the local database
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //this method is used to remove data from the database
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //this method is used to check if the local database contains a certain {key}
  Future<bool> containsKey({required String key}) async {
    return await sharedPreferences.containsKey(key);
  }

  //used to clear data from the local database
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  //this method is used to put data in the local database using a key
  Future<dynamic> put({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }
}
