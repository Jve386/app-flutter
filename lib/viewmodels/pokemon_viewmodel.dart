import 'package:flutter/foundation.dart';
import '../models/pokemon.dart';
import '../services/api_service.dart';

class PokemonViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Pokemon> pokemonList = [];

  Future<void> fetchPokemon({int count = 6}) async {
    isLoading = true;
    notifyListeners();

    try {
      pokemonList = await ApiService.fetchRandomPokemon(count: count);
    } catch (e) {
      print('Error fetching Pokémon: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}