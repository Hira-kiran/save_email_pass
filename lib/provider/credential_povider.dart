import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../Model/credential_model.dart';

class CredentialsProvider with ChangeNotifier {
  final storage = const FlutterSecureStorage();
  CredentialsModel? _credentials;

  CredentialsModel? get credentials => _credentials;

  Future<void> saveCredentials(String username, String password) async {
    await storage.write(key: 'username', value: username);
    await storage.write(key: 'password', value: password);
    _credentials = CredentialsModel(username, password);
    notifyListeners();
  }

  Future<void> readCredentials() async {
    final username = await storage.read(key: 'username');
    final password = await storage.read(key: 'password');
    if (username != null && password != null) {
      _credentials = CredentialsModel(username, password);
      notifyListeners();
    }
  }
}
