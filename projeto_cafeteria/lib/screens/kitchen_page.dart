import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/services/order_service.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
          onPressed: () => Navigator.pop(context),
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
                  if (pendingOrders.isNotEmpty) ...[
                    StatusSection(
                      title: 'Pending',
                      icon: Icons.pending_outlined,
                      color: CoffeeColors.error,
                      orders: pendingOrders,
                      nextStatus: 'Preparing',
                    ),
                    const SizedBox(height: 32),
                  ],
                  if (preparingOrders.isNotEmpty) ...[
                    StatusSection(
                      title: 'Preparing',
                      icon: Icons.restaurant_rounded,
                      color: CoffeeColors.warning,
                      orders: preparingOrders,
                      nextStatus: 'Ready to go',
                    ),
                    const SizedBox(height: 32),
                  ],
                  if (readyOrders.isNotEmpty) ...[
                    StatusSection(
                      title: 'Ready to go',
                      icon: Icons.check_circle_outline_rounded,
                      color: CoffeeColors.success,
                      orders: readyOrders,
                      nextStatus: 'Completed',
                    ),
                  ],
                  if (pendingOrders.isEmpty &&
                      preparingOrders.isEmpty &&
                      readyOrders.isEmpty) ...[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(60),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.restaurant_outlined,
                              size: 80,
                              color: CoffeeColors.latte,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "No active requests",
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(color: CoffeeColors.coffeeBrown),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'The orders will appear here',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(color: CoffeeColors.latte),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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

class KitchenOrderCard extends StatelessWidget {
  final MockOrder order;
  final String nextStatus;
  final Color color;

  const KitchenOrderCard({super.key, 
    required this.order,
    required this.nextStatus,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: color.withOpacity(0.08),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.table_restaurant_rounded,
                        color: color,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      'Table ${order.tableNumber}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: CoffeeColors.coffeeBrown,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.access_time_rounded, color: color, size: 16),
                      const SizedBox(width: 6),
                      Text(
                        DateFormat('HH:mm').format(order.createdAt),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: CoffeeColors.coffeeBrown,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                ...order.items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${item.quantity}',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            item.productName,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: CoffeeColors.coffeeBrown,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (order.notes != null) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: CoffeeColors.beige,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.note_outlined,
                          size: 18,
                          color: CoffeeColors.coffeeLight,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            order.notes!,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: CoffeeColors.coffeeLight,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Updated order for: $nextStatus'),
                          backgroundColor: color,
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(_getButtonIcon(nextStatus), size: 22),
                        const SizedBox(width: 10),
                        Text(
                          _getButtonText(nextStatus),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

IconData _getButtonIcon(String status) {
  switch (status) {
    case 'Preparing':
      return Icons.play_arrow_rounded;
    case 'Ready':
      return Icons.check_rounded;
    case 'Completed':
      return Icons.done_all_rounded;
    default:
      return Icons.arrow_forward_rounded;
  }
}

String _getButtonText(String status) {
  switch (status) {
    case 'Preparing':
      return 'Start Preparation';
    case 'Ready':
      return 'Mark as Done';
    case 'Completed':
      return 'Complete Order';
    default:
      return 'Complete';
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
