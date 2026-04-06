import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/nav.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projeto_cafeteria/config/routes.dart';
import 'package:projeto_cafeteria/models/menu_product.dart';
import 'package:projeto_cafeteria/screens/orders/order_sumary_page.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({super.key});
  @override
  State<NewOrderPage> createState() => _NewOrdersPageState();
}

class _NewOrdersPageState extends State<NewOrderPage> {
  List<MenuProduct> menuItems = [
    MenuProduct(name: "Espresso", price: 19.50),
    MenuProduct(name: "Croassaint", price: 12.00),
    MenuProduct(name: "Capuccino", price: 20.00),
    MenuProduct(name: "Iced tea", price: 20.00),
    MenuProduct(name: "Chocolate Cookie", price: 8.00),
    MenuProduct(name: "Oreo Cheesecake", price: 25.00),
    MenuProduct(name: "Orange Juice", price: 12.00),
    MenuProduct(name: "Matcha", price: 20.00),
    MenuProduct(name: "Lemon Cheesecake", price: 27.00),
  ];

  double get total =>
      menuItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  int get totalItems => menuItems.fold(0, (sum, item) => sum + (item.quantity));

  @override
  Widget build(BuildContext context) {
    const isLoading = false;
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        backgroundColor: CoffeeColors.coffeeLight,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8),
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
        title: Text(
          "Add new order",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            color: CoffeeColors.cream,
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
                  // const Text(
                  //   'Table selection',
                  //   style: TextStyle(
                  //     fontFamily: AppFonts.mainFont,
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //     color: CoffeeColors.coffeeBrown,
                  //   ),
                  // ),
                  // const SizedBox(height: 16),

                  // ListTile(
                  //   tileColor: CoffeeColors.beige,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   leading: const Icon(
                  //     Icons.table_restaurant,
                  //     color: CoffeeColors.coffeeDark,
                  //   ),
                  //   title: const Text(
                  //     "Selected table",
                  //     style: TextStyle(
                  //       color: CoffeeColors.coffeeDark,
                  //       fontFamily: AppFonts.mainFont,
                  //     ),
                  //   ),
                  //   trailing: Text(
                  //     selectedTable == null
                  //         ? "Click here to select"
                  //         : "Table $selectedTable",
                  //     style: const TextStyle(
                  //       color: CoffeeColors.coffeeBrown,
                  //       fontFamily: AppFonts.mainFont,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 17,
                  //     ),
                  //   ),
                  //   onTap: () async {
                  //     // Continua rodando sem travar ---> Futures
                  //     final result =
                  //         await Navigator.pushNamed(
                  //               context,
                  //               // espera até receber essa informação apra descer para linha de baixo do IF
                  //               Routes.tableSelection,
                  //               arguments: selectedTable,
                  //             )
                  //             as int?;
                  //     if (result != null) {
                  //       setState(() => selectedTable = result);
                  //     }
                  //   },
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: CoffeeColors.latte.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.coffee,
                            color: CoffeeColors.coffeeDark,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
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
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
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
                            style: TextStyle(
                              color: CoffeeColors.cream,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.mainFont,
                            ),
                          ),
                          subtitle: Text(
                            "R\$ ${item.price.toStringAsFixed(2)}",
                            style: TextStyle(color: CoffeeColors.cream),
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
                    "$totalItems selected items",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    "R\$ ${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
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
                onPressed: (totalItems > 0)
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OrderSummaryPage(order: menuItems),
                          ),
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

  Widget _buildOrderCard(BuildContext buildContext) {
    return Card(
      color: CoffeeColors.mocha,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(),
    );
  }
}
