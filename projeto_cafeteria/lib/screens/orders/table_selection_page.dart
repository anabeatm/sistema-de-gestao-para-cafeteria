import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';

class TableSelectionPage extends StatelessWidget {
  const TableSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        title: const Text("Escolha a Mesa"),
        backgroundColor: CoffeeColors.coffeeLight,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: 15,
        itemBuilder: (context, index) {
          int tableNum = index + 1;
          return InkWell(
            onTap: () => Navigator.pop(context, tableNum),
            child: Container(
              decoration: BoxDecoration(
                color: CoffeeColors.mocha,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Center(
                child: Text(
                  "Mesa $tableNum",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
