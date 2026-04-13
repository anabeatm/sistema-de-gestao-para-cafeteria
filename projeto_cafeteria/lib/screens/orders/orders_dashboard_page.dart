import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/config/routes.dart';
import 'package:projeto_cafeteria/theme.dart';

class OrdersDashboardPage extends StatelessWidget {
  const OrdersDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(title: const Text("Orders Management"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDashboardCard(
              context,
              title: "New Order",
              subtitle: "Start a new table or takeaway order",
              icon: Icons.add_shopping_cart,
              route: Routes.categories,
            ),
            const SizedBox(height: 24),
            _buildDashboardCard(
              context,
              title: "View Orders",
              subtitle: "Manage pending and ready orders",
              icon: Icons.receipt_long,
              route: Routes.orders,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required String route,
  }) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: CoffeeColors.coffeeLight,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CoffeeColors.cream,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: CoffeeColors.coffeeDark),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: CoffeeColors.cream,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: CoffeeColors.cream.withValues(alpha: 0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: CoffeeColors.cream),
          ],
        ),
      ),
    );
  }
}
