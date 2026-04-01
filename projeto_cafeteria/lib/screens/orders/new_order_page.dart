import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/nav.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({super.key});
  // método obrigatório que conecta com o estado
  @override
  State<NewOrderPage> createState() => _NewOrdersPageState();
}

// classe stateful
class _NewOrdersPageState extends State<NewOrderPage> {
  int? selectedTable;

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
                  const Text(
                    'Table selection',
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CoffeeColors.coffeeBrown,
                    ),
                  ),
                  const SizedBox(height: 16),

                  ListTile(
                    tileColor: CoffeeColors.beige,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    leading: const Icon(
                      Icons.table_restaurant,
                      color: CoffeeColors.coffeeDark,
                    ),
                    title: const Text(
                      "Selected table",
                      style: TextStyle(fontFamily: AppFonts.mainFont),
                    ),
                    trailing: Text(
                      selectedTable == null
                          ? "Select table >"
                          : "Table $selectedTable",
                      style: const TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () async {
                      final result = await context.push<int>(
                        AppRoutes.tableSelection,
                      );
                      if (result != null) {
                        setState(() => selectedTable = result);
                      }
                    },
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Order Items",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.bold,
                      color: CoffeeColors.coffeeDark,
                    ),
                  ),
                  // _buildOrderCard --> aqui
                ],
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
