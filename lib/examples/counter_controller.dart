import 'package:flutter/material.dart';

class UserProfileModel extends ChangeNotifier{
  String _name = 'Camilla';
  int _age = 17;
  String _email = 'camilla@gmail.com';
  bool _isOnline = false;
  List<String> _hobbies =  ['Programação', 'Leitura'];

  String get name => _name;
  int get age => _age;
  String get email => _email;
  bool get isOnline => _isOnline;
  List<String> get hobbies => List.unmodifiable(_hobbies);

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateAge(int newAge) {
    _age = newAge;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void toggleOnlineStatus() {
    _isOnline = !_isOnline;
    notifyListeners();
  }

  void addHobby(String hobby) {
    if(!_hobbies.contains(hobby)){
      _hobbies.add(hobby);
      notifyListeners();
    }
  }

  void removeHobby(String hobby) {
      _hobbies.remove(hobby);
      notifyListeners();
    }

  void reset() {
    _name = 'Camilla';
    _age = 17;
    _email = 'camilla@gmail.com';
    _isOnline = false;
    _hobbies =  ['Programação', 'Leitura'];
    notifyListeners();
    }
  }
