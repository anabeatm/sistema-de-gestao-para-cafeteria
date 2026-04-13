import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/config/routes.dart';
import 'package:projeto_cafeteria/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.coffeeLight,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CoffeeColors.coffeeBrown,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(Icons.coffee, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "CafeFlow",
                      style: TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontSize: FontSize.xg,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Management System",
                      style: TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontSize: FontSize.md,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            const Text(
              'Modules',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontSize: FontSize.g,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildButton(
                    context,
                    icon: Icons.receipt_long,
                    title: "Orders",
                    description: "View customer orders",
                    route: Routes.ordersDashboard,
                  ),
                  _buildButton(
                    context,
                    icon: Icons.coffee_maker,
                    title: "Kitchen",
                    description: "Prepare orders",
                    route: Routes.kitchen,
                  ),
                  _buildButton(
                    context,
                    icon: Icons.inventory_2,
                    title: "Inventory",
                    description: "Manage stock items",
                    route: Routes.inventory,
                  ),
                  _buildButton(
                    context,
                    icon: Icons.menu_book,
                    title: "Menu",
                    description: "View menu",
                    route: Routes.menuPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required String route,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 42,
            backgroundColor: Colors.grey[350],
            child: Icon(icon, color: CoffeeColors.coffeeBrown, size: 42),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              color: CoffeeColors.coffeeBrown,
              fontFamily: AppFonts.mainFont,
              fontSize: FontSize.md,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: AppFonts.mainFont,
              fontSize: FontSize.p,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
