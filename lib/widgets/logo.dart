import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({super.key, required this.titulo});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Image(image: AssetImage('assets/tag-logo.png')),
          const SizedBox(height: 20),
          Text(titulo, style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
