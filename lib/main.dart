import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/pokemon_viewmodel.dart';
import 'views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PokemonViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Pokémon Demo',
        home: HomeScreen(),
      ),
    );
  }
}
