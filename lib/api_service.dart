import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

class ApiService {
  static const int totalPokemon = 1010; // Número total de Pokémon en la Pokédex????

  static Future<List<Map<String, dynamic>>> getRandomItems({int count = 6}) async {
    final random = Random();
    List<int> randomIds = List.generate(count, (_) => random.nextInt(totalPokemon) + 1);

    List<Map<String, dynamic>> pokemonDetails = [];

    for (int id in randomIds) {
      final url = 'https://pokeapi.co/api/v2/pokemon/$id';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final details = json.decode(response.body);

        // Obtener habilidades
        final abilities = details['abilities']
            .map((ability) => ability['ability']['name'])
            .join(', ');

        // Construir la URL de la imagen
        final imageUrl =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

        pokemonDetails.add({
          'name': details['name'],
          'abilities': abilities,
          'imageUrl': imageUrl,
        });
      }
    }

    return pokemonDetails;
  }
}
