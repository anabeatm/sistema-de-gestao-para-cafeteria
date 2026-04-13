import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';

class InventoryMovementPage extends StatelessWidget {
  const InventoryMovementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movements = [
      {
        'name': 'Coffee Beans',
        'type': 'IN',
        'quantity': 5.0,
        'date': '2026-04-10',
      },
      {
        'name': 'Milk',
        'type': 'OUT',
        'quantity': 2.0,
        'date': '2026-04-11',
      },
      {
        'name': 'Sugar',
        'type': 'OUT',
        'quantity': 1.5,
        'date': '2026-04-12',
      },
    ];

    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        backgroundColor: CoffeeColors.cream,
        foregroundColor: CoffeeColors.coffeeBrown,
        title: const Text("Movement History"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: movements.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = movements[index];
            final isEntry = item['type'] == 'IN';

            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CoffeeColors.coffeeBrown,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['date'] as String,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        isEntry ? 'Entrada' : 'Saída',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isEntry
                              ? Colors.green
                              : CoffeeColors.error,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${item['quantity']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CoffeeColors.coffeeBrown,
                        ),
                      ),
                    ],
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