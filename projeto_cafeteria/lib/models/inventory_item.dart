
class InventoryItem {
  final String id;
  final String name;
  final String unit;
  final double quantity;
  final double minQuantity;
  final String? category;
  final DateTime createdAt;
  final DateTime updatedAt;

  InventoryItem({
    required this.id,
    required this.name,
    required this.unit,
    required this.quantity,
    required this.minQuantity,
    this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isLowStock => quantity <= minQuantity;
}
