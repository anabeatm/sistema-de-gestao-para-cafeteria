import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';

class CategoryReportPage extends StatelessWidget {
  const CategoryReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Beans',
        'items': 10,
      },
      {
        'name': 'Dairy',
        'items': 6,
      },
      {
        'name': 'Others',
        'items': 8,
      },
    ];

    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        backgroundColor: CoffeeColors.cream,
        foregroundColor: CoffeeColors.coffeeBrown,
        title: const Text("Category Report"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: categories.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = categories[index];

            return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nome da categoria
                  Text(
                    item['name'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CoffeeColors.coffeeBrown,
                    ),
                  ),

                  // Quantidade de itens
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: CoffeeColors.beige,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${item['items']} items',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CoffeeColors.coffeeBrown,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}