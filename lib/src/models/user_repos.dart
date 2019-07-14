import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {

  Future<String> registration({
    @required String username,
    @required String password,
    @required String name,
    @required String surname,
    @required String phone,
    @required String email,
    @required BuildContext context,
  }) async {
    return '1';
  }

  Future<String> authenticate({
    @required String username,
    @required String password,
    @required BuildContext context,
  }) async {
    return '1';
  }

  Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('accessToken');
  }

  Future<void> persistToken(String accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('accessToken', accessToken);
  }

  Future<bool> hasToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken') != null ? prefs.getString('accessToken').isNotEmpty : false;
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken') ?? '';
  }
}