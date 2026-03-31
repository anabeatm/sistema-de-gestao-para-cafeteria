import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:flutter/material.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({super.key});
  // método obrigatório que conecta com o estado
  @override
  State<NewOrderPage> createState() => _NewOrdersPageState();
}

// classe stateful
class _NewOrdersPageState extends State<NewOrderPage> {
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
          style: TextStyle(color: CoffeeColors.cream),
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
                    'Select table',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CoffeeColors.coffeeBrown,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      int tableNum = index + 1;
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: CoffeeColors.mocha,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "$tableNum",
                              style: TextStyle(color: CoffeeColors.beige),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "order Items",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CoffeeColors.coffeeDark,
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
