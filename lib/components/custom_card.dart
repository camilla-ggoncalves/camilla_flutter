import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Widget destination;
  final Color? iconColor;
  final double? elevation; 
  const CustomCard({
    super.key, 
    required this.title, 
    required this.description, 
    required this.icon, 
    required this.destination, 
    this.iconColor, 
    this.elevation
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: ListTile(
        leading: Icon(
        icon,
        color: iconColor ?? Colors.blue, // atributo da esquerda não obrigatório, se o usuário não escolher será definido na cor azul
        size: 32,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text(description),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () { // função anônima, sem nome
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => destination)            
            );
          },
      ),
    );
  }
}