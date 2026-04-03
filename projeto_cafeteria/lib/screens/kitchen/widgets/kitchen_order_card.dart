import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/services/order_service.dart';

class KitchenOrderCard extends StatelessWidget {
  final MockOrder order;
  final String nextStatus;
  final Color color;
  final VoidCallback onActionPressed;

  const KitchenOrderCard({
    super.key,
    required this.order,
    required this.nextStatus,
    required this.color,
    required this.onActionPressed,
  });

  IconData _getButtonIcon(String status) {
    switch (status) {
      case 'Preparing':
        return Icons.play_arrow_rounded;
      case 'Ready to go':
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
      case 'Ready to go':
        return 'Mark as Ready';
      case 'Completed':
        return 'Complete Order';
      default:
        return 'Complete';
    }
  }

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
            padding: EdgeInsets.all(18),
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
                        fontFamily: AppFonts.mainFont,
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
                          fontFamily: AppFonts.mainFont,
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
                                  fontFamily: AppFonts.mainFont,
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
                                  fontFamily: AppFonts.mainFont,
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
                                  fontFamily: AppFonts.mainFont,
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
                    onPressed: onActionPressed,
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
                                fontFamily: AppFonts.mainFont,
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
