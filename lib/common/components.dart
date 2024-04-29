import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      IconButton(
        onPressed: () {
          // Reduzir a quantidade
          // Implemente sua lógica aqui
        },
        icon: const Icon(Icons.remove),
      ),
      const Text(
        '1', // Aqui você pode colocar a quantidade inicial ou vinculá-la a um contador
        style: TextStyle(fontSize: 16),
      ),
      IconButton(
        onPressed: () {
          // Aumentar a quantidade
          // Implemente sua lógica aqui
        },
        icon: const Icon(Icons.add),
      ),
    ],
  );
  }
}
