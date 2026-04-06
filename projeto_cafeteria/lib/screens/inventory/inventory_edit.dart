import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/models/inventory_item.dart';
import 'package:projeto_cafeteria/models/enums/inventory_enums.dart'; // Necessário para os Dropdowns
import 'package:projeto_cafeteria/theme.dart';

class InventoryEditPage extends StatefulWidget {
  final InventoryItem item;

  const InventoryEditPage({super.key, required this.item});

  @override
  State<InventoryEditPage> createState() => _InventoryEditPageState();
}

class _InventoryEditPageState extends State<InventoryEditPage> {
  late TextEditingController nameController;
  late TextEditingController quantityController;
  late TextEditingController minController;
  
  InventoryUnit? selectedUnit;
  InventoryCategory? selectedCategory;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.item.name);
    quantityController = TextEditingController(text: widget.item.quantity.toString());
    minController = TextEditingController(text: widget.item.minQuantity.toString());
    selectedUnit = widget.item.unit;
    selectedCategory = widget.item.category;
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
          'Edit Item',
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontSize: FontSize.xg,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                hintStyle: const TextStyle(color: CoffeeColors.coffeeLight),
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
              initialSelection: selectedCategory,
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
              dropdownMenuEntries: InventoryCategory.values.map((category) {
                return DropdownMenuEntry(
                  value: category,
                  label: category.name.toUpperCase(),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: CoffeeColors.coffeeBrown,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}