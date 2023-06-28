import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:oic_next_to_you/common/core/session.dart';
import '../models/logged_in_user/logged_in_user.dart';

abstract class LocalLoggedInUserDatasource {
  Future<LoggedInUser?> getLoggedInUser();
  Future<bool> setLoggedInUser(LoggedInUser? user);
}

class SharedPreferenceLocalLoggedInUserDatasource
    implements LocalLoggedInUserDatasource {
  final SharedPreferences sharedPreferences;

  SharedPreferenceLocalLoggedInUserDatasource(
      {required this.sharedPreferences});

  @override
  Future<LoggedInUser?> getLoggedInUser() async {
    final storedUserJson = sharedPreferences.getString('logged_in_user');
    if (storedUserJson == null) {
      return null;
    }
    try {
      Map<String, dynamic> decodedJson = json.decode(storedUserJson);
      Session().SetUserID(decodedJson["id"]);
      Session().SetPhoneNumber(decodedJson["phoneNumber"]);
      return LoggedInUser.fromJson(decodedJson);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> setLoggedInUser(LoggedInUser? user) async {
    if (user == null) {
      sharedPreferences.remove('logged_in_user');
      return true;
    }
    final userJson = user.toJson();
    return await sharedPreferences.setString(
        'logged_in_user', json.encode(userJson));
  }
}
