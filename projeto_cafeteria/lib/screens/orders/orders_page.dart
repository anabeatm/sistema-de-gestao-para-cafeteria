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
            padding: EdgeInsets.all(8),
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
      color: CoffeeColors.cream, // Fundo claro
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Column(
        children: [
          // mesa e status
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: CoffeeColors.beige,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.table_restaurant,
                        color: CoffeeColors.coffeeBrown,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mesa,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Text(
                          "08/03 • 16:50",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: CoffeeColors.mocha.withOpacity(1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // produtos
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _buildProductRow("1x", "Espresso", "R\$ 8,50"),
                _buildProductRow("1x", "Cappuccino", "R\$ 12,00"),
                _buildProductRow("1x", "Croissant", "R\$ 9,00"),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // rodape
          Container(
            padding: const EdgeInsets.all(16),
            color: CoffeeColors.coffeeBrown, //shadow box
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    color: CoffeeColors.caramel,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  total,
                  style: const TextStyle(
                    color: CoffeeColors.caramel,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductRow(String qtd, String nome, String preco) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: CoffeeColors.coffeeBrown,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              qtd,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              nome,
              style: const TextStyle(color: CoffeeColors.espresso),
            ),
          ),
          Text(preco, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
