import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/config/Routes.dart';
// Importe seu arquivo de rotas para usar o AppRoutes
import 'package:projeto_cafeteria/theme.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = false;
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        backgroundColor: CoffeeColors.coffeeLight,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(0.8),
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
        title: const Text('Order list', style: TextStyle()),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: CoffeeColors.coffeeBrown),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildOrderCard(
                          context,
                          "Mesa 02",
                          "R\$ 25.00",
                          "Pending",
                        ),
                        _buildOrderCard(
                          context,
                          "Mesa 05",
                          "R\$ 45.00",
                          "preparing",
                        ),
                        _buildOrderCard(
                          context,
                          "Mesa 04",
                          "R\$ 65.00",
                          "Done",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.newOrder);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // depois vai receber os dados do objeto de Pedido
  Widget _buildOrderCard(
    BuildContext context,
    String mesa,
    String total,
    String status,
  ) {
    return Card(
      color: CoffeeColors.caramel,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(
          Icons.table_restaurant,
          color: CoffeeColors.coffeeBrown,
        ),
        title: Text(mesa, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          "Status: $status",
          style: const TextStyle(color: CoffeeColors.coffeeDark),
        ),
        trailing: Text(
          total,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () {},
      ),
    );
  }
}
