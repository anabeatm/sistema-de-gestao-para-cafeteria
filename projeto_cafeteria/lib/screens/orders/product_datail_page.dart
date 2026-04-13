import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/models/menu_product.dart';
import 'package:projeto_cafeteria/stores/inventory_store.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuProduct? product =
        ModalRoute.of(context)?.settings.arguments as MenuProduct?;

    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(
          child: Text(
            "Product not found",
            style: TextStyle(
              color: CoffeeColors.coffeeBrown,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 7, 4, 4)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 260,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: CoffeeColors.beige,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: const Icon(
                Icons.coffee,
                size: 100,
                color: CoffeeColors.coffeeBrown,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CoffeeColors.coffeeBrown,
                        ),
                      ),
                      Text(
                        "R\$ ${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CoffeeColors.coffeeBrown,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildTag(
                        product.category.name
                            .replaceAll('Drinks', ' Drinks')
                            .replaceAll('Snacks', ' Snacks'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CoffeeColors.coffeeBrown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "A carefully crafted item from our menu to bring you the best experience.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CoffeeColors.coffeeBrown,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CoffeeColors.coffeeBrown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (product.recipe.isEmpty)
                    const Text(
                      "Ready to eat item.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CoffeeColors.coffeeBrown,
                      ),
                    )
                  else
                    ...product.recipe.map((ingredient) {
                      final inventoryItem = InventoryStore.getById(
                        ingredient.inventoryId,
                      );
                      final itemName =
                          inventoryItem?.name ?? "Unknown Ingredient";
                      final itemUnit = inventoryItem?.unit.name ?? "";
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          "• ${ingredient.amount}$itemUnit $itemName",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CoffeeColors.coffeeBrown,
                          ),
                        ),
                      );
                    }),

                  const SizedBox(height: 20),

                  const Text(
                    "Size",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CoffeeColors.coffeeBrown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildSize("S"),
                      _buildSize("M"),
                      _buildSize("L"),
                    ],
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CoffeeColors.coffeeDark,
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Back to Menu",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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

  Widget _buildTag(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: CoffeeColors.latte,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          color: CoffeeColors.coffeeDark,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSize(String size) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: CoffeeColors.coffeeBrown),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        size,
        style: const TextStyle(
          color: CoffeeColors.coffeeBrown,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
