import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/nav.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projeto_cafeteria/config/routes.dart';

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
                      style: TextStyle(
                        color: CoffeeColors.coffeeDark,
                        fontFamily: AppFonts.mainFont,
                      ),
                    ),
                    trailing: Text(
                      selectedTable == null
                          ? "Click here to select"
                          : "Table $selectedTable",
                      style: const TextStyle(
                        color: CoffeeColors.coffeeBrown,
                        fontFamily: AppFonts.mainFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () async {
                      // Continua rodando sem travar ---> Futures
                      final result =
                          await Navigator.pushNamed(
                                context,
                                // espera até receber essa informação apra descer para linha de baixo do IF
                                Routes.tableSelection,
                              )
                              as int?;
                      if (result != null) {
                        setState(() => selectedTable = result);
                      }
                    },
                  ),

                  const SizedBox(
                    height: double.maxFinite,
                    width: double.infinity,
                    child: const Text(
                      "Order Items",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppFonts.mainFont,
                        fontWeight: FontWeight.bold,
                        color: CoffeeColors.coffeeDark,
                      ),
                    ),
                  ),
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
