import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/config/routes.dart';
import 'package:projeto_cafeteria/models/menu_product.dart';
import 'package:projeto_cafeteria/models/enums/menu_category_enums.dart';
import 'package:projeto_cafeteria/stores/menu_store.dart'; // Ajuste o caminho se for stores ou store

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  MenuCategory? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final List<MenuProduct> displayedItems = selectedCategory == null
        ? MenuStore.getAll()
        : MenuStore.getByCategory(selectedCategory!);

    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: CoffeeColors.cream,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: CoffeeColors.coffeeDark,
              size: 20,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Digital Menu",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            color: CoffeeColors.coffeeBrown,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildFilterChip(null, "All"),
                  _buildFilterChip(MenuCategory.hotDrinks, "Hot Drinks"),
                  _buildFilterChip(MenuCategory.coldDrinks, "Cold Drinks"),
                  _buildFilterChip(MenuCategory.savorySnacks, "Savory Snacks"),
                  _buildFilterChip(MenuCategory.sweets, "Sweets"),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: displayedItems.length,
              itemBuilder: (context, index) {
                final item = displayedItems[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: CoffeeColors.coffeeLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(
                      item.name,
                      style: const TextStyle(
                        color: CoffeeColors.cream,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.mainFont,
                      ),
                    ),
                    subtitle: Text(
                      "R\$ ${item.price.toStringAsFixed(2)}",
                      style: const TextStyle(color: CoffeeColors.cream),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        // Vai pra tela de detalhes, aproveitando o que já fizemos!
                        Navigator.pushNamed(
                          context,
                          Routes.productDetail,
                          arguments: item,
                        );
                      },
                      child: const Text(
                        "Details",
                        style: TextStyle(
                          color: CoffeeColors.caramel,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(MenuCategory? category, String label) {
    final isSelected = selectedCategory == category;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedCategory = category;
          });
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? CoffeeColors.coffeeDark
                : CoffeeColors.latte.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? CoffeeColors.cream : CoffeeColors.coffeeDark,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.mainFont,
            ),
          ),
        ),
      ),
    );
  }
}
