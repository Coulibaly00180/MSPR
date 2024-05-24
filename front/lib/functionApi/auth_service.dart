import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:front/token.dart';

class AuthService {

  static final TokenStorage _tokenStorage = TokenStorage();

  // Inscription
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

  // Connexion
  static Future<bool> signin(String email, String password) async {
    final url = Uri.parse('http://localhost:9002/api/v1/authentification/signin');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Connexion réussie
      // Sauvegarder le jeton d'authentification
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String token = responseData['token'];
      await _tokenStorage.saveToken(token);
      print('Connexion réussie');
      return true;
    } else {
      // Connexion échouée
      print('Erreur lors de la connexion: ${response.body}');
      return false;
    }
  }
}