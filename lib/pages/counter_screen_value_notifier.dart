import 'package:flutter/material.dart';

class CounterScreenValueNotifier extends StatefulWidget {
  const CounterScreenValueNotifier({super.key});

  @override
  State<CounterScreenValueNotifier> createState() =>
      _CounterScreenValueNotifierState();
}

class _CounterScreenValueNotifierState extends State<CounterScreenValueNotifier> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<String> _messageNotifier =
      ValueNotifier<String>('Toque no botão para alterar o contador');
  final ValueNotifier<Color> _counterColor = ValueNotifier<Color>(Colors.blue);

  void _incrementCounter() {
    _counter.value++;
    _updateMessage();
    _updateColor();
  }

  void _decrementCounter() {
    _counter.value--;
    _updateMessage();
    _updateColor();
  }

  void _resetCounter() {
    _counter.value = 0; 
    _updateMessage();
    _updateColor();
  }

  void _updateMessage() {
    if (_counter.value == 0) {
      _messageNotifier.value = 'Contador zerado';
    } else if (_counter.value > 0) {
      _messageNotifier.value = 'Contador positivo';
    } else {
      _messageNotifier.value = 'Contador negativo';
    }
  }

  void _updateColor() {
    if (_counter.value > 0) {
      _counterColor.value = Colors.green;
    } else if (_counter.value < 0) {
      _counterColor.value = Colors.red;
    } else {
      _counterColor.value = Colors.blue;
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
              ValueListenableBuilder<Color>(
                valueListenable: _counterColor,
                builder: (context, color, _) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: color, width: 2),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Valor do Contador:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ValueListenableBuilder<int>(
                          valueListenable: _counter,
                          builder: (context, number, _) {
                            return Text(
                              '$number',
                              style: const TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
              ValueListenableBuilder<String>(
                valueListenable: _messageNotifier,
                builder: (context, message, _) {
                  return Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.pinkAccent,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
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
