class Pokemon {
  final String name;
  final String abilities;
  final String imageUrl;

  Pokemon({
    required this.name,
    required this.abilities,
    required this.imageUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json, int id) {
    final abilities = (json['abilities'] as List)
        .map((ability) => ability['ability']['name'])
        .join(', ');
    final imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

    return Pokemon(
      name: json['name'],
      abilities: abilities,
      imageUrl: imageUrl,
    );
  }
}