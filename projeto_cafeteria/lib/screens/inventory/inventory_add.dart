import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/models/enums/inventory_enums.dart';
import 'package:projeto_cafeteria/stores/inventory_store.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/models/inventory_item.dart';

class InventoryAddPage extends StatefulWidget {
  const InventoryAddPage({super.key});

  @override
  State<InventoryAddPage> createState() => _InventoryAddPageState();
}

class _InventoryAddPageState extends State<InventoryAddPage> {
  final nameController = TextEditingController();
  InventoryUnit? selectedUnit;
  final quantityController = TextEditingController();
  final minController = TextEditingController();
  InventoryCategory? selectedCategory;

  void saveItem() {
    final name = nameController.text.trim();
    final quantity = double.tryParse(quantityController.text) ?? 0;
    final minQuantity = double.tryParse(minController.text) ?? 0;

    if (name.isEmpty || selectedUnit == null || selectedCategory == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    final item = InventoryItem(
      id: '',
      name: name,
      unit: selectedUnit!,
      quantity: quantity,
      minQuantity: minQuantity,
      category: selectedCategory!,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    InventoryStore.addItem(item);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        backgroundColor: CoffeeColors.cream,
        foregroundColor: CoffeeColors.coffeeBrown,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: CoffeeColors.coffeeBrown,
              size: 20,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add Item',
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontSize: FontSize.xg,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              style: const TextStyle(color: CoffeeColors.espresso),
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: const TextStyle(color: CoffeeColors.coffeeLight),
                filled: true,
                fillColor: CoffeeColors.beige,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: CoffeeColors.espresso),
              decoration: InputDecoration(
                labelText: "Quantity",
                labelStyle: const TextStyle(color: CoffeeColors.coffeeLight),
                filled: true,
                fillColor: CoffeeColors.beige,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: minController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: CoffeeColors.espresso),
              decoration: InputDecoration(
                labelText: "Min Quantity",
                labelStyle: const TextStyle(color: CoffeeColors.coffeeLight),
                filled: true,
                fillColor: CoffeeColors.beige,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 12),

            DropdownMenu<InventoryUnit>(
              hintText: 'Unit Type',
              width: double.infinity,
              initialSelection: selectedUnit,
              onSelected: (value) {
                setState(() {
                  selectedUnit = value;
                });
              },

              inputDecorationTheme: InputDecorationTheme(
                labelStyle: const TextStyle(color: CoffeeColors.coffeeLight),
                hintStyle: TextStyle(color: CoffeeColors.coffeeLight),
                filled: true,
                fillColor: CoffeeColors.beige,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),

              textStyle: const TextStyle(
                color: CoffeeColors.espresso,
                fontFamily: AppFonts.mainFont,
              ),

              dropdownMenuEntries: InventoryUnit.values.map((unit) {
                return DropdownMenuEntry(
                  value: unit,
                  label: unit.name.toUpperCase(),
                );
              }).toList(),
            ),

            const SizedBox(height: 12),

            DropdownMenu<InventoryCategory>(
              hintText: "Category",
              width: double.infinity,
              onSelected: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },

              inputDecorationTheme: InputDecorationTheme(
                labelStyle: const TextStyle(color: CoffeeColors.coffeeLight),
                hintStyle: const TextStyle(color: CoffeeColors.coffeeLight),
                filled: true,
                fillColor: CoffeeColors.beige,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              textStyle: const TextStyle(
                color: CoffeeColors.espresso,
                fontFamily: AppFonts.mainFont,
              ),

              dropdownMenuEntries: InventoryCategory.values.map((unit) {
                return DropdownMenuEntry(
                  value: unit,
                  label: unit.name.toUpperCase(),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: CoffeeColors.coffeeBrown,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
