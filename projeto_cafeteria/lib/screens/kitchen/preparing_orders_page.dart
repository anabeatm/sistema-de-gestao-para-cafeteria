import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_cafeteria/services/order_service.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/screens/kitchen/widgets/kitchen_order_card.dart';

class PreparingOrdersPage extends StatelessWidget {
  const PreparingOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        title: const Text(
          'Preparing Orders',
          style: TextStyle(fontFamily: AppFonts.mainFont),
        ),
        backgroundColor: CoffeeColors.warning,
        foregroundColor: Colors.white,
      ),
      body: Consumer<OrderService>(
        builder: (context, orderService, child) {
          final orders = orderService.preparingOrders;

          if (orders.isEmpty) {
            return const Center(child: Text("No preparing orders!"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return KitchenOrderCard(
                order: order,
                nextStatus: 'Ready',
                color: CoffeeColors.warning,
                onActionPressed: () {
                  orderService.moveToReady(order);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Order moved to Ready!'),
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
