import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/config/routes.dart';
import 'package:projeto_cafeteria/models/inventory_item.dart';
import 'package:projeto_cafeteria/stores/inventory_store.dart';
import 'package:projeto_cafeteria/theme.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    final items = InventoryStore.getAll();
    final itemslow = InventoryStore.getLowStockItems();

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
          'Inventory',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (itemslow.isNotEmpty) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: CoffeeColors.error.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: CoffeeColors.error),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CoffeeColors.error,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: const Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Warning: Low Stock',
                          style: const TextStyle(
                            fontFamily: AppFonts.mainFont,
                            fontWeight: FontWeight.bold,
                            color: CoffeeColors.error,
                          ),
                        ),

                        const SizedBox(height: 1),

                        Text(
                          '${itemslow.length} items need to be restocked',
                          style: const TextStyle(
                            fontFamily: AppFonts.mainFont,
                            fontWeight: FontWeight.bold,
                            color: CoffeeColors.coffeeBrown,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CoffeeColors.beige,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.dashboard_rounded,
                        color: CoffeeColors.coffeeBrown,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontSize: FontSize.xg,
                        fontWeight: FontWeight.bold,
                        color: CoffeeColors.coffeeBrown,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 4.5,
                  children: [
                    _ActionButton(
                      title: 'All Items',
                      icon: Icons.list,
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.inventoryList,
                      ).then((_) => setState(() {})),
                    ),
                    _ActionButton(
                      title: 'Low Stock Items',
                      icon: Icons.warning_amber_outlined,
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.lowStock,
                      ).then((_) => setState(() {})),
                    ),
                    _ActionButton(
                      title: 'Add',
                      icon: Icons.add_box_outlined,
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.inventoryAdd,
                      ).then((_) => setState(() {})),
                    ),
                    _ActionButton(
                      title: 'Edit',
                      icon: Icons.edit_outlined,
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.inventoryEdit,
                      ).then((_) => setState(() {})),
                    ),
                    _ActionButton(
                      title: 'Filtered List',
                      icon: Icons.filter_list_outlined,
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.filteredList,
                      ).then((_) => setState(() {})),
                    ),
                    _ActionButton(
                      title: 'Movement',
                      icon: Icons.swap_horiz_outlined,
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.inventoryMovement,
                      ).then((_) => setState(() {})),
                    ),
                    _ActionButton(
                      title: 'Report',
                      icon: Icons.bar_chart_outlined,
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.consumptionReport,
                      ).then((_) => setState(() {})),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionButton({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: CoffeeColors.coffeeBrown,
        shadowColor: Colors.black.withOpacity(0.3),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 5),
          Text(
            title,
            style: const TextStyle(
              fontFamily: AppFonts.mainFont,
              fontSize: FontSize.md,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}