import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;
  String _message = 'Toque no botão para alterar o contador';
  Color _counterColor = Colors.blue;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _updateMessage();
      _updateColor();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _updateMessage();
      _updateColor();
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _message = 'Contador reiniciado';
      _counterColor = Colors.blue;
    });
  }

  void _updateMessage() {
    if (_counter == 0) {
      _message = 'Contador zerado';
    } else if (_counter > 0) {
      _message = 'Contador positivo $_counter';
    } else {
      _message = 'Contador negativo $_counter';
    }
  }

  void _updateColor() {
    if (_counter > 0) {
      _counterColor = Colors.green;
    } else if (_counter < 0) {
      _counterColor = Colors.red;
    } else {
      _counterColor = Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contador Interativo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 147, 81, 124),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _counterColor.withAlpha(255), // cor sólida
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: _counterColor, width: 2),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Valor do Contador:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$_counter',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.pinkAccent,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _decrementCounter,
                    child: const Text('Decrementar'),
                  ),
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Text('Incrementar'),
                  ),
                  ElevatedButton(
                    onPressed: _resetCounter,
                    child: const Text('Resetar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
