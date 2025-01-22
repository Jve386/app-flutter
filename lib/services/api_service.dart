import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class ApiService {
  static const int totalPokemon = 1010;

  static Future<List<Pokemon>> fetchRandomPokemon({int count = 6}) async {
    final random = Random();
    final randomIds = List.generate(count, (_) => random.nextInt(totalPokemon) + 1);
    final List<Pokemon> pokemonList = [];

    for (final id in randomIds) {
      final url = 'https://pokeapi.co/api/v2/pokemon/$id';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        pokemonList.add(Pokemon.fromJson(json, id));
      }
    }

    return pokemonList;
  }
}