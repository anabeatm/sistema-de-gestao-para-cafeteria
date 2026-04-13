import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/config/routes.dart';
import 'package:projeto_cafeteria/models/menu_product.dart';
import 'package:projeto_cafeteria/models/enums/menu_category_enums.dart';
import 'package:projeto_cafeteria/stores/menu_store.dart'; // Ajuste o caminho se for stores ou store
import 'package:projeto_cafeteria/screens/orders/order_sumary_page.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({super.key});
  @override
  State<NewOrderPage> createState() => _NewOrdersPageState();
}

class _NewOrdersPageState extends State<NewOrderPage> {
  List<MenuProduct> displayedItems = [];
  List<MenuProduct> currentCart = [];

  int? selectedTable;
  bool initialized = false;

  double get total =>
      displayedItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  int get totalItems =>
      displayedItems.fold(0, (sum, item) => sum + (item.quantity));

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (args != null) {
        currentCart = List.from(args['cart'] ?? []);

        selectedTable = args['table'];

        final MenuCategory category = args['category'];

        final storeItems = MenuStore.getByCategory(category);

        displayedItems = storeItems.map((storeItem) {
          final cartItem = currentCart
              .where((c) => c.id == storeItem.id)
              .firstOrNull;
          return storeItem.copyWith(quantity: cartItem?.quantity ?? 0);
        }).toList();
      }
      initialized = true;
    }

    const isLoading = false;

    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        // backgroundColor: CoffeeColors.coffeeLight,
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
          onPressed: _saveAndPopBack,
        ),
        title: const Text(
          "Add new order",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            color: CoffeeColors.coffeeBrown,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: CoffeeColors.coffeeDark),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: CoffeeColors.latte.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.coffee,
                            color: CoffeeColors.coffeeDark,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Order Items",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: AppFonts.mainFont,
                            fontWeight: FontWeight.bold,
                            color: CoffeeColors.coffeeDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: displayedItems.length,
                    itemBuilder: (context, index) {
                      final item = displayedItems[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        color: CoffeeColors.coffeeLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: item.quantity > 0
                              ? const BorderSide(
                                  color: CoffeeColors.coffeeDark,
                                  width: 2,
                                )
                              : BorderSide.none,
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
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.productDetail,
                                    arguments: item,
                                  );
                                },
                                child: const Text(
                                  "Details",
                                  style: TextStyle(color: CoffeeColors.caramel),
                                ),
                              ),
                              if (item.quantity > 0) ...[
                                IconButton(
                                  onPressed: () {
                                    setState(() => item.quantity--);
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: CoffeeColors.caramel,
                                  ),
                                ),
                                Text(
                                  "${item.quantity}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFonts.mainFont,
                                    color: CoffeeColors.cream,
                                  ),
                                ),
                              ],
                              IconButton(
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: CoffeeColors.caramel,
                                ),
                                onPressed: () {
                                  setState(() => item.quantity++);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: CoffeeColors.cream,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
                    "R\$ ${total.toStringAsFixed(2)}",
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
                        Navigator.pushNamed(
                          context,
                          Routes.itemsSummary,
                          arguments: {
                            'order': _getMergedCart(),
                            'table': selectedTable,
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

  // Função auxiliar para juntar o que já tinha no carrinho com o que foi editado agora
  List<MenuProduct> _getMergedCart() {
    final mergedCart = List<MenuProduct>.from(currentCart);
    for (var item in displayedItems) {
      mergedCart.removeWhere((c) => c.id == item.id);
      if (item.quantity > 0) {
        mergedCart.add(item);
      }
    }
    return mergedCart;
  }

  // Função para voltar para Categorias salvando os dados
  void _saveAndPopBack() {
    Navigator.pop(context, _getMergedCart());
  }
}
