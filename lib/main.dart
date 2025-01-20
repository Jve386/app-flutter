import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Pokémon Demo',
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pokémon'),
      ),
      body: dataProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: dataProvider.items.length,
        itemBuilder: (context, index) {
          final item = dataProvider.items[index];
          return ListTile(
            leading: Image.network(
              item['imageUrl'],
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error);
              },
            ),
            title: Text(
              item['name'].toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            subtitle: Text('Habilidades: ${item['abilities']}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Cargar 10 Pokémon aleatorios al presionar el botón.
          dataProvider.fetchRandomItems(count: 6);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
