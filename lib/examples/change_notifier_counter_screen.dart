import 'package:flutter/material.dart';

class CounterScreenValueNotifier extends ChangeNotifier {
  int _counter = 0;
  String _message = 'Toque no botão para alterar o contador';
  Color _color = Colors.blue;

  int get counter => _counter;
  String get message => _message;
  Color get color => _color;

  void updateCounter (int newCounter) {
    _counter = newCounter;
    notifyListeners();
  }

  void updateMessage (String newMessage) {
    _message = newMessage;
    notifyListeners();
  }

  void updateColor (Color newColor) {
    _color = newColor;
    notifyListeners();
  }

  void increment () {
    _counter += 1;
    _message = 'Valor incrementado';
    _color = Colors.green;
    notifyListeners();
  }

    void decrement () {
    _counter -= 1;
    _message = 'Valor decrementado';
    _color = Colors.red;
    notifyListeners();
  }

    void reset () {
    _counter = 0;
    _message = 'Valor zerado';
    _color = const Color.fromARGB(255, 139, 140, 139);
    notifyListeners();
  }


}


