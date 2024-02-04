import 'package:flutter/material.dart';

class ExpandedStatusProvider with ChangeNotifier {
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void setExpandedStatus(bool value) {
    _isExpanded = value;
    notifyListeners();
  }
}
