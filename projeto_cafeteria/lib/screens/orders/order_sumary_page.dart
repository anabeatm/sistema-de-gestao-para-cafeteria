import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/models/menu_product.dart';
import 'package:projeto_cafeteria/config/routes.dart';

class OrderSummaryPage extends StatelessWidget {
  final List<MenuProduct> order;

  const OrderSummaryPage({super.key, required this.order});

  double get total =>
      order.fold(0, (sum, item) => sum + item.price * item.quantity);

  int get totalItems => order.fold(0, (sum, item) => sum + item.quantity);

  @override
  Widget build(BuildContext context) {
    final filteredItems = order.where((item) => item.quantity > 0).toList();

    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        title: const Text("Order Summary"),
        backgroundColor: CoffeeColors.coffeeLight,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];

                  return Card(
                    color: CoffeeColors.coffeeLight,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(
                        item.name,
                        style: const TextStyle(
                          color: CoffeeColors.cream,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${item.quantity}x • R\$ ${item.price.toStringAsFixed(2)}",
                        style: const TextStyle(color: CoffeeColors.cream),
                      ),
                      trailing: Text(
                        "R\$ ${(item.price * item.quantity).toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: CoffeeColors.caramel,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CoffeeColors.beige,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$totalItems items"),
                      Text(
                        "R\$ ${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: CoffeeColors.coffeeBrown,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CoffeeColors.coffeeDark,
                        padding: const EdgeInsets.all(16),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.success);
                      },
                      child: const Text(
                        "Confirm Order",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
