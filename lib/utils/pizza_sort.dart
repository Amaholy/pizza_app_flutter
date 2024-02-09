import 'package:flutter/material.dart';

class PizzaSort extends StatelessWidget {
  final String pizzaSort;
  final bool isSelected;
  final VoidCallback onTap;

  const PizzaSort(
      {super.key,
      required this.pizzaSort,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          pizzaSort,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.amber : Colors.white),
        ),
      ),
    );
  }
}
