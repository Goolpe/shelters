import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthorizationProvider with ChangeNotifier{
  bool _isAuthorized = false;
  bool get isAuthorized => _isAuthorized;

  Future<void> init() async{
    final _storage = FlutterSecureStorage();
    String _token = await _storage.read(key: 'token') ?? '';
    _isAuthorized = !_token.isNotEmpty;
    notifyListeners();
  }
}