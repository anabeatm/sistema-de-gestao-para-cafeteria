import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_cafeteria/services/order_service.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/screens/kitchen/widgets/kitchen_order_card.dart';

class PendingOrdersPage extends StatelessWidget {
  const PendingOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        title: const Text(
          'Pending Orders',
          style: TextStyle(fontFamily: AppFonts.mainFont),
        ),
        backgroundColor: CoffeeColors.error,
        foregroundColor: Colors.white,
      ),
      body: Consumer<OrderService>(
        builder: (context, orderService, child) {
          final orders = orderService.pendingOrders;

          if (orders.isEmpty) {
            return const Center(child: Text("No pending orders!"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return KitchenOrderCard(
                order: order,
                nextStatus: 'Preparing',
                color: CoffeeColors.error,
                onActionPressed: () {
                  orderService.moveToPreparing(order);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Order moved to Preparing!'),
                      backgroundColor: CoffeeColors.warning,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
