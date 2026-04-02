import 'package:projeto_cafeteria/models/enums/inventory_enums.dart';

class InventoryItem {
  final String id;
  final String name;
  final InventoryUnit unit;
  final double quantity;
  final double minQuantity;
  final InventoryCategory category;
  final DateTime createdAt;
  final DateTime updatedAt;

  InventoryItem({
    required this.id,
    required this.name,
    required this.unit,
    required this.quantity,
    required this.minQuantity,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isLowStock => quantity <= minQuantity;

  bool get isOutOfStock => quantity == 0;

  InventoryItem copyWith({
    String? id,
    String? name,
    InventoryUnit? unit,
    double? quantity,
    double? minQuantity,
    InventoryCategory? category,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => InventoryItem(
    id: id ?? this.id,
    name: name ?? this.name,
    unit: unit ?? this.unit,
    quantity: quantity ?? this.quantity,
    minQuantity: minQuantity ?? this.minQuantity,
    category: category ?? this.category,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}
