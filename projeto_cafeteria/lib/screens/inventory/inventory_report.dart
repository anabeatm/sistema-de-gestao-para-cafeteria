import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/screens/inventory/inventory_report_category.dart';
import 'package:projeto_cafeteria/screens/inventory/inventory_report_movement.dart';
import 'package:projeto_cafeteria/theme.dart';

class InventoryReportPage extends StatelessWidget {
  const InventoryReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        backgroundColor: CoffeeColors.cream,
        foregroundColor: CoffeeColors.coffeeBrown,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.arrow_back, size: 20),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Reports"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _ReportCard(
              title: "Movement History",
              description: "See all inventory entries and exits",
              icon: Icons.swap_horiz,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const InventoryMovementPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _ReportCard(
              title: "Category Report",
              description: "Analyze items grouped by category",
              icon: Icons.category,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CategoryReportPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _ReportCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: CoffeeColors.beige,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: CoffeeColors.coffeeBrown),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CoffeeColors.coffeeBrown,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
