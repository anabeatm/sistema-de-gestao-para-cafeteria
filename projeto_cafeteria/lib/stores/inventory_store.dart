import '../models/inventory_item.dart';
import 'package:projeto_cafeteria/models/enums/inventory_enums.dart';

class InventoryStore {
  static final List<InventoryItem> _items = _seed();

  static int _counter = _items.length;

  static InventoryItem addItem(InventoryItem item) {
    final newItem = item.copyWith(
      id: _generateId(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _items.add(newItem);
    return newItem;
  }

  static List<InventoryItem> getAll() => List.unmodifiable(_items);

  static InventoryItem? getById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }

  static bool updateItem(InventoryItem updatedItem) {
    final index = _items.indexWhere((i) => i.id == updatedItem.id);
    if (index == -1) return false;

    _items[index] = updatedItem.copyWith(updatedAt: DateTime.now());
    return true;
  }

  static bool deleteItem(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index == -1) return false;
    _items.removeAt(index);
    return true;
  }

  static String _generateId() {
    _counter++;
    return _counter.toString();
  }

  static List<InventoryItem> getLowStockItems() {
    return _items.where((i) => i.isLowStock).toList();
  }

  static List<InventoryItem> getOutOfStockItems() {
    return _items.where((i) => i.isOutOfStock).toList();
  }

  static List<InventoryItem> _seed() {
    final now = DateTime.now();

    return [
      InventoryItem(
        id: '1',
        name: 'Coffee',
        unit: InventoryUnit.g,
        quantity: 500,
        minQuantity: 100,
        category: InventoryCategory.base,
        createdAt: now.subtract(Duration(days: 5)),
        updatedAt: now.subtract(Duration(days: 2)),
      ),
      InventoryItem(
        id: '2',
        name: 'Water',
        unit: InventoryUnit.ml,
        quantity: 2000,
        minQuantity: 500,
        category: InventoryCategory.base,
        createdAt: now.subtract(Duration(days: 1)),
        updatedAt: now,
      ),
      InventoryItem(
        id: '3',
        name: 'Milk',
        unit: InventoryUnit.ml,
        quantity: 1000,
        minQuantity: 300,
        category: InventoryCategory.dairy,
        createdAt: now.subtract(Duration(days: 4)),
        updatedAt: now.subtract(Duration(days: 1)),
      ),
      InventoryItem(
        id: '4',
        name: 'Mint',
        unit: InventoryUnit.g,
        quantity: 0,
        minQuantity: 30,
        category: InventoryCategory.herb,
        createdAt: now.subtract(Duration(days: 2)),
        updatedAt: now.subtract(Duration(days: 1)),
      ),
      InventoryItem(
        id: '5',
        name: 'Honey',
        unit: InventoryUnit.g,
        quantity: 0,
        minQuantity: 50,
        category: InventoryCategory.sweetener,
        createdAt: now.subtract(Duration(days: 5)),
        updatedAt: now.subtract(Duration(days: 2)),
      ),
      InventoryItem(
        id: '6',
        name: 'Black Tea',
        unit: InventoryUnit.g,
        quantity: 25,
        minQuantity: 50,
        category: InventoryCategory.tea,
        createdAt: now.subtract(Duration(days: 4)),
        updatedAt: now.subtract(Duration(days: 2)),
      ),
      InventoryItem(
        id: '7',
        name: 'Green Tea',
        unit: InventoryUnit.g,
        quantity: 220,
        minQuantity: 50,
        category: InventoryCategory.tea,
        createdAt: now.subtract(Duration(days: 3)),
        updatedAt: now.subtract(Duration(days: 1)),
      ),
      InventoryItem(
        id: '8',
        name: 'Cinnamon',
        unit: InventoryUnit.g,
        quantity: 100,
        minQuantity: 20,
        category: InventoryCategory.spice,
        createdAt: now.subtract(Duration(days: 6)),
        updatedAt: now.subtract(Duration(days: 4)),
      ),
      InventoryItem(
        id: '9',
        name: 'Chocolate',
        unit: InventoryUnit.g,
        quantity: 50,
        minQuantity: 100,
        category: InventoryCategory.sweet,
        createdAt: now.subtract(Duration(days: 5)),
        updatedAt: now.subtract(Duration(days: 2)),
      ),
      InventoryItem(
        id: '10',
        name: 'Detergent',
        unit: InventoryUnit.ml,
        quantity: 500,
        minQuantity: 200,
        category: InventoryCategory.cleaning,
        createdAt: now.subtract(Duration(days: 3)),
        updatedAt: now.subtract(Duration(days: 1)),
      ),
      InventoryItem(
        id: '11',
        name: 'Portafilter',
        unit: InventoryUnit.un,
        quantity: 2,
        minQuantity: 1,
        category: InventoryCategory.equipment,
        createdAt: now.subtract(Duration(days: 10)),
        updatedAt: now.subtract(Duration(days: 5)),
      ),
      InventoryItem(
        id: '12',
        name: 'Notebook',
        unit: InventoryUnit.un,
        quantity: 2,
        minQuantity: 1,
        category: InventoryCategory.other,
        createdAt: now.subtract(Duration(days: 7)),
        updatedAt: now.subtract(Duration(days: 2)),
      ),
    ];
  }
}
