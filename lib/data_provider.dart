import 'package:flutter/material.dart';
import 'api_service.dart';

class DataProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Map<String, dynamic>> items = [];

  Future<void> fetchRandomItems({int count = 6}) async {
    isLoading = true;
    notifyListeners();

    try {
      final fetchedItems = await ApiService.getRandomItems(count: count);
      items = fetchedItems;
    } catch (e) {
      print('Error al obtener los datos: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
