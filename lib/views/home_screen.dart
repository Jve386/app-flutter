import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/pokemon_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PokemonViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon List'),
      ),
      body: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: viewModel.pokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = viewModel.pokemonList[index];
          return ListTile(
            leading: Image.network(
              pokemon.imageUrl,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
            title: Text(
              pokemon.name.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            subtitle: Text('Abilities: ${pokemon.abilities}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.fetchPokemon(count: 6),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
