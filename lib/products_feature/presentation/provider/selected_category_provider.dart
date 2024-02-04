import 'package:flutter/material.dart';

class SelectedCategoryProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  final List<String> _categories = [
    'All Items',
    'Women\'s Clothing',
    'Men\'s Clothing',
    'Jewelery',
    'Electronics'
  ];

  int get selectedIndex => _selectedIndex;
  List<String> get categories => _categories;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // memberi tahu listener bahwa nilai telah berubah
  }
}
