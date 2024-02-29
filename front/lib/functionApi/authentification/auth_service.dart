import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static Future<bool> signup(String pseudo, String password, String email, String nom, String prenom, String adresse) async {
    final url = Uri.parse('http://localhost:9002/api/v1/authentification/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'pseudo': pseudo,
        'password': password,
        'email': email,
        'nom': nom,
        'prenom': prenom,
        'adresse': adresse,
      }),
    );

    if (response.statusCode == 200) {
      // Inscription réussie
      print('Inscription réussie');
      return true;
    } else {
      // Erreur lors de l'inscription
      print('Erreur lors de l\'inscription: ${response.body}');
      return false;
    }
  }
}
