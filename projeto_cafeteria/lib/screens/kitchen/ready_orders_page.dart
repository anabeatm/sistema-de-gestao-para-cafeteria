import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_cafeteria/services/order_service.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/screens/kitchen/widgets/kitchen_order_card.dart';

class ReadyOrdersPage extends StatelessWidget {
  const ReadyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        title: const Text(
          'Ready to go',
          style: TextStyle(fontFamily: AppFonts.mainFont),
        ),
        backgroundColor: CoffeeColors.success,
        foregroundColor: Colors.white,
      ),
      body: Consumer<OrderService>(
        builder: (context, orderService, child) {
          final orders = orderService.readyOrders;

          if (orders.isEmpty) {
            return const Center(
              child: Text(
                "No ready orders at the moment!",
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontSize: FontSize.md,
                  color: CoffeeColors.coffeeLight,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];

              return KitchenOrderCard(
                order: order,
                nextStatus: 'Completed',
                color: CoffeeColors.success,
                onActionPressed: () {
                  orderService.moveToCompleted(order);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Order completed and delivered!'),
                      backgroundColor: CoffeeColors.success,
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
