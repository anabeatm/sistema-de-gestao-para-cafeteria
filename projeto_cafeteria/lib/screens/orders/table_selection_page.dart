import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';

class TableSelectionPage extends StatelessWidget {
  const TableSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        title: const Text("Select table"),
        backgroundColor: CoffeeColors.coffeeLight,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          int tableNum = index + 1;
          return InkWell(
            onTap: () => Navigator.pop(context, tableNum),
            child: Container(
              decoration: BoxDecoration(
                color: CoffeeColors.coffeeLight,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: CoffeeColors.coffeeBrown.withValues(alpha: 1.0),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.table_restaurant,
                    color: CoffeeColors.cream,
                    size: 28,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "table $tableNum",
                    style: const TextStyle(
                      color: CoffeeColors.cream,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
