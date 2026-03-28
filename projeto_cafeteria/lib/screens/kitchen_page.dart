import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:projeto_cafeteria/services/order_service.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:provider/provider.dart';

class KitchenPage extends StatefulWidget {
  const KitchenPage({super.key});

  @override
  State<KitchenPage> createState() => _KitchenPageState();
}

class _KitchenPageState extends State<KitchenPage> {
  final bool isLoading = false;

  final List<MockOrder> pendingOrders = [
    MockOrder(
      id: 1,
      tableNumber: 4,
      createdAt: DateTime.now().subtract(const Duration(minutes: 12)),
      items: [
        MockOrderItem(quantity: 2, productName: "Café expresso"),
        MockOrderItem(quantity: 1, productName: "Pão de Queijo"),
      ],
      notes: "Com açucar",
    ),
  ];

  final List<MockOrder> preparingOrders = [
    MockOrder(
      id: 2,
      tableNumber: 1,
      createdAt: DateTime.now().subtract(const Duration(minutes: 25)),
      items: [
        MockOrderItem(quantity: 1, productName: 'Cappuccino'),
        MockOrderItem(quantity: 1, productName: 'Bolo de Cenoura'),
      ],
    ),
  ];

  final List<MockOrder> readyOrders = [
    MockOrder(
      id: 3,
      tableNumber: 6,
      createdAt: DateTime.now().subtract(const Duration(minutes: 40)),
      items: [
        MockOrderItem(quantity: 3, productName: 'Suco de Laranja'),
        MockOrderItem(quantity: 3, productName: 'Croissant de Frango'),
      ],
      notes: 'Embalar para viagem',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        backgroundColor: CoffeeColors.caramel,
        elevation: 0,
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
          onPressed: () => context.pop(),
        ),
        title: Text("Kitchen"),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: CoffeeColors.coffeeBrown,
              ), // literal uma bolinha carregando ate isLoading ser false
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (pendingOrders.isNotEmpty) ...[StatusSection()],
                ],
              ),
            ),
    );
  }
}

class StatusSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<MockOrder> orders;
  final String nextStatus;

  const StatusSection({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.orders,
    required this.nextStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 26),
            ),
            const SizedBox(width: 14),
            Text(title),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('${orders.length}'),
            ),
          ],
        ),
        const SizedBox(height: 18),
        ...orders.map(
          (order) => KitchenOrderCard(
            order: order,
            nextStatus: nextStatus,
            color: color,
          ),
        ),
      ],
    );
  }
}

class MockOrder {
  final int id;
  final int tableNumber;
  final DateTime createdAt;
  final List<MockOrderItem> items;
  final String? notes;

  MockOrder({
    required this.id,
    required this.tableNumber,
    required this.createdAt,
    required this.items,
    this.notes,
  });
}

class MockOrderItem {
  final int quantity;
  final String productName;

  MockOrderItem({required this.quantity, required this.productName});
}
