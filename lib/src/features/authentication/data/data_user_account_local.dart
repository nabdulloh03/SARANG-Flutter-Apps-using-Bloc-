import 'dart:convert';

import 'package:berayean/src/features/authentication/domain/user_account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataUserAccountLocal {

  static const userAccountKey = 'userAccountKey';

  static getDataUserFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(userAccountKey) ?? '';
    return jsonDecode(result);
  }

  static setDataUserToStorage (UserAccount userAccount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userAccountKey, jsonEncode(userAccount.toMap()));
  }
  
}

class UserAccountRegister {
  static const userAccountRegisterKey = 'userAccountRegister';

  static Future<bool> getUserAccountRegister() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userAccountRegisterKey) ?? false;
  }

  static void setUserAccountRegister(bool isRegister) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userAccountRegisterKey, isRegister);
  }

  static void userAccountLogout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(userAccountRegisterKey);
  }
}