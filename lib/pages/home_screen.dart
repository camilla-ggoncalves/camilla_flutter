import 'package:flutter/material.dart';
import 'package:intro_flutter/components/custom_card.dart';
import 'package:intro_flutter/pages/counter_screen_page.dart';
import 'package:intro_flutter/examples/counter_screen_value_notifier.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: const Color.fromARGB(255, 244, 111, 155),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CustomCard(
                      title: 'Counter Screen',
                      description: 'Exemplo Contador',
                      icon: Icons.post_add_sharp,
                      destination: CounterScreenValueNotifier())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


