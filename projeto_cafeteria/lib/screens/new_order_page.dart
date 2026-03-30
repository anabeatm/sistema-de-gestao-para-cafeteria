import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';

class NewOrderPage extends StatelessWidget {
  const NewOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        backgroundColor: CoffeeColors.coffeeLight,
        title: Text(
          "Add new order",
          style: TextStyle(color: CoffeeColors.coffeeDark),
        ),
      ),
    );
  }
}
