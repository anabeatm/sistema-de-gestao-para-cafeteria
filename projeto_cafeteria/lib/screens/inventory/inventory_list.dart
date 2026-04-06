import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/models/inventory_item.dart';
import 'package:projeto_cafeteria/stores/inventory_store.dart';
import 'package:projeto_cafeteria/theme.dart';

class InventoryList extends StatefulWidget {
  const InventoryList({super.key});

  @override
  State<InventoryList> createState() => _InventoryListState();
}

class _InventoryListState extends State<InventoryList> {
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
          'Inventory List',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Icons.inventory_2,
                            color: CoffeeColors.coffeeBrown,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'All Items',
                          style: TextStyle(
                            fontFamily: AppFonts.mainFont,
                            fontSize: FontSize.xg,
                            fontWeight: FontWeight.bold,
                            color: CoffeeColors.coffeeBrown,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CoffeeColors.beige,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Text(
                        '${items.length} items',
                        style: TextStyle(
                          fontFamily: AppFonts.mainFont,
                          fontSize: FontSize.p,
                          fontWeight: FontWeight.bold,
                          color: CoffeeColors.coffeeBrown,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                _ListInventoryItems(items: items),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ListInventoryItems extends StatelessWidget {
  final List<InventoryItem> items;

  const _ListInventoryItems({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = items[index];

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: CoffeeColors.warmCream,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        color: CoffeeColors.coffeeBrown,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.mainFont,
                        fontSize: FontSize.md,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CoffeeColors.beige,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                      child: Text(
                        item.category.name,
                        style: const TextStyle(
                          fontSize: FontSize.p,
                          fontFamily: AppFonts.mainFont,
                          color: CoffeeColors.coffeeBrown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: FontSize.p,
                            fontFamily: AppFonts.mainFont,
                            color: CoffeeColors.coffeeLight,
                          ),
                        ),
                        Text(
                          '${item.quantity} ${item.unit.name}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.mainFont,
                            color: item.isOutOfStock
                                ? CoffeeColors.error
                                : item.isLowStock
                                ? CoffeeColors.warning
                                : CoffeeColors.coffeeBrown,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Minimum',
                          style: TextStyle(
                            fontSize: FontSize.p,
                            fontFamily: AppFonts.mainFont,
                            color: CoffeeColors.coffeeLight,
                          ),
                        ),
                        Text(
                          '${item.minQuantity} ${item.unit.name}',
                          style: const TextStyle(
                            fontFamily: AppFonts.mainFont,
                            color: CoffeeColors.coffeeBrown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
