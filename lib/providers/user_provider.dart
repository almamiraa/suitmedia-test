import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = '';
  String _selectedUser = '';

  String get name => _name;
  String get selectedUser => _selectedUser;

  void setName(String value) {
    _name = value;
    notifyListeners(); // ⬅️ update UI yang pakai `name`
  }

  void setSelectedUser(String value) {
    _selectedUser = value;
    notifyListeners(); // ⬅️ update UI yang pakai `selectedUser`
  }

  void reset() {
    _name = '';
    _selectedUser = '';
    notifyListeners();
  }
}
