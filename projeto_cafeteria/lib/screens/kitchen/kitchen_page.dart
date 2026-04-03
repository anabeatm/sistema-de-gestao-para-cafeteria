import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/config/routes.dart';

class KitchenPage extends StatelessWidget {
  const KitchenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        backgroundColor: CoffeeColors.cream,
        foregroundColor: CoffeeColors.coffeeBrown,
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
        title: const Text(
          'Kitchen Modules',
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontSize: FontSize.xg,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildKitchenModule(
              context,
              title: "Pending Orders",
              icon: Icons.pending_outlined,
              color: CoffeeColors.error,
              route: Routes.pendingOrders,
            ),
            const SizedBox(height: 20),
            _buildKitchenModule(
              context,
              title: "Preparing",
              icon: Icons.restaurant_rounded,
              color: CoffeeColors.warning,
              route: Routes.preparingOrders,
            ),
            const SizedBox(height: 20),
            _buildKitchenModule(
              context,
              title: "Ready to go",
              icon: Icons.check_circle_outline_rounded,
              color: CoffeeColors.success,
              route: Routes.readyOrders,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKitchenModule(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required String route,
  }) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3), width: 2),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
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
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 36),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontSize: FontSize.xg,
                  fontWeight: FontWeight.bold,
                  color: CoffeeColors.coffeeBrown,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: CoffeeColors.coffeeLight,
            ),
          ],
        ),
      ),
    );
  }
}
