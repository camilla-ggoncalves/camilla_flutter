import 'package:flutter/material.dart';

/// Exemplo simples de ValueNotifier
/// ValueNotifier é uma classe que estende ChangeNotifier e mantém um único valor
/// Quando o valor muda, todos os listeners são notificados automaticamente
class SimpleValueNotifierExample extends StatefulWidget {
  const SimpleValueNotifierExample({super.key});

  @override
  State<SimpleValueNotifierExample> createState() =>
      _SimpleValueNotifierExampleState();
}

class _SimpleValueNotifierExampleState
    extends State<SimpleValueNotifierExample> {
  // ValueNotifier para armazenar um número
  final ValueNotifier<int> _numberNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    // Importante: sempre dispose dos ValueNotifiers para evitar memory leaks
    _numberNotifier.dispose();
    super.dispose();
  }

  void _incrementNumber() {
    _numberNotifier.value++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier Simples'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card para exemplo de texto
            const SizedBox(height: 20),

            // Card para exemplo de número
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Exemplo 2: ValueNotifier<int>',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ValueListenableBuilder<int>(
                      valueListenable: _numberNotifier,
                      builder: (context, value, child) {
                        return Text(
                          'Número: $value',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: value > 5 ? Colors.green : Colors.blue,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _incrementNumber,
                      child: const Text('Incrementar'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Card para exemplo de booleano
          ],
        ),
      ),
    );
  }
}
