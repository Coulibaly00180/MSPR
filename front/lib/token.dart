import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class TokenStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt_token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'jwt_token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'jwt_token');
  }
}

Future<void> makeAuthenticatedRequest() async {
  var tokenStorage = TokenStorage();
  String? token = await tokenStorage.getToken();

  if (token != null) {
    var response = await http.get(
      Uri.parse('http://<votre_serveur>/some_protected_endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Traiter la réponse
      print('Data: ${response.body}');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } else {
    print('No token found, user might be logged out');
  }
}
