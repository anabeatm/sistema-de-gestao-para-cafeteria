import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/config/routes.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/models/menu_product.dart';
import 'package:projeto_cafeteria/models/enums/menu_category_enums.dart'; // Importante para o Enum
import 'package:projeto_cafeteria/screens/orders/order_sumary_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int? selectedTable;

  // O carrinho começa vazio e vai enchendo conforme o usuário navega
  List<MenuProduct> currentOrder = [];

  double get totalValue =>
      currentOrder.fold(0, (sum, item) => sum + item.price * item.quantity);

  int get totalItems =>
      currentOrder.fold(0, (sum, item) => sum + item.quantity);

  // Adicionamos a tag 'enum' para ligar o visual com o "Banco de Dados"
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Hot Drinks',
      'icon': Icons.coffee_rounded,
      'enum': MenuCategory.hotDrinks,
    },
    {
      'name': 'Cold Drinks',
      'icon': Icons.local_drink,
      'enum': MenuCategory.coldDrinks,
    },
    {
      'name': 'Savory snacks',
      'icon': Icons.bakery_dining_rounded,
      'enum': MenuCategory.savorySnacks,
    },
    {'name': 'Sweets', 'icon': Icons.cake_rounded, 'enum': MenuCategory.sweets},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        title: const Text("Select category"),
        backgroundColor: CoffeeColors.coffeeLight,
        centerTitle: true,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              tileColor: CoffeeColors.beige,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              leading: const Icon(
                Icons.table_restaurant,
                color: CoffeeColors.coffeeDark,
              ),
              title: Text(
                selectedTable == null ? "Select Table" : "Table $selectedTable",
                style: const TextStyle(
                  color: CoffeeColors.coffeeDark,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.mainFont,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  Routes.tableSelection,
                  arguments: selectedTable,
                );

                if (result != null && result is int) {
                  setState(() => selectedTable = result);
                }
              },
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.1,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];

                return InkWell(
                  onTap: () async {
                    // Aqui empacotamos o carrinho, a mesa e a categoria
                    final result = await Navigator.pushNamed(
                      context,
                      Routes.newOrder,
                      arguments: {
                        'cart': currentOrder,
                        'category': cat['enum'],
                        'table': selectedTable,
                      },
                    );

                    // Atualiza o carrinho com os dados que voltaram da NewOrderPage
                    if (result != null && result is List<MenuProduct>) {
                      setState(() => currentOrder = result);
                    }
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: CoffeeColors.coffeeLight,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(cat['icon'], size: 48, color: CoffeeColors.cream),
                        const SizedBox(height: 12),
                        Text(
                          cat['name'],
                          style: const TextStyle(
                            color: CoffeeColors.cream,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: CoffeeColors.cream,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$totalItems items",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    "R\$ ${totalValue.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CoffeeColors.coffeeBrown,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CoffeeColors.coffeeDark,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBackgroundColor: Colors.grey[300],
                ),
                onPressed: (totalItems > 0 && selectedTable != null)
                    ? () {
                        // Usa o pushNamed para o main.dart desempacotar
                        Navigator.pushNamed(
                          context,
                          Routes.itemsSummary,
                          arguments: {
                            'order': currentOrder,
                            'table': selectedTable, // <-- Enviando a mesa!
                          },
                        );
                      }
                    : null,
                child: const Text(
                  "Finish",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
