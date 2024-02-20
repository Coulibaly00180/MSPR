import 'package:front/model/address.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<Address>> fetchAddresses(String query) async {
    try {
      final url = Uri.parse('https://api-adresse.data.gouv.fr/search/?q=$query&limit=5');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List features = json.decode(response.body)['features'];
        return features.map((feature) {
          final properties = feature['properties'];
          final coordinates = feature['geometry']['coordinates'];
          return Address(
            label: properties['label'],
            longitude: coordinates[0],
            latitude: coordinates[1],
          );
        }).toList();
      } else {
        print('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Erreur lors de la récupération des adresses: $e");
    }
    return []; // Return an empty list on failure or empty query
  }