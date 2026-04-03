import 'package:flutter/material.dart';

class MockOrder {
  final int id;
  final int tableNumber;
  final DateTime createdAt;
  final List<MockOrderItem> items;
  final String? notes;

  MockOrder({
    required this.id,
    required this.tableNumber,
    required this.createdAt,
    required this.items,
    this.notes,
  });
}

class MockOrderItem {
  final int quantity;
  final String productName;

  MockOrderItem({required this.quantity, required this.productName});
}

class OrderService extends ChangeNotifier {
  final List<MockOrder> _pendingOrders = [
    MockOrder(
      id: 1,
      tableNumber: 4,
      createdAt: DateTime.now().subtract(const Duration(minutes: 12)),
      items: [
        MockOrderItem(quantity: 2, productName: "Expresso Coffee"),
        MockOrderItem(quantity: 1, productName: "Pão de Queijo"),
      ],
      notes: "without sugar",
    ),
  ];

  final List<MockOrder> _preparingOrders = [
    MockOrder(
      id: 2,
      tableNumber: 1,
      createdAt: DateTime.now().subtract(const Duration(minutes: 25)),
      items: [
        MockOrderItem(quantity: 1, productName: 'Cappuccino'),
        MockOrderItem(quantity: 1, productName: 'Carriot cake'),
      ],
    ),
  ];

  final List<MockOrder> _readyOrders = [
    MockOrder(
      id: 3,
      tableNumber: 6,
      createdAt: DateTime.now().subtract(const Duration(minutes: 40)),
      items: [
        MockOrderItem(quantity: 3, productName: 'Orange juice'),
        MockOrderItem(quantity: 3, productName: 'Chicken Croissant'),
      ],
      notes: 'delivery',
    ),
  ];

  List<MockOrder> get pendingOrders => _pendingOrders;
  List<MockOrder> get preparingOrders => _preparingOrders;
  List<MockOrder> get readyOrders => _readyOrders;

  void moveToPreparing(MockOrder order) {
    _pendingOrders.remove(order);
    _preparingOrders.add(order);
    notifyListeners();
  }

  void moveToReady(MockOrder order) {
    _preparingOrders.remove(order);
    _readyOrders.add(order);
    notifyListeners();
  }

  void moveToCompleted(MockOrder order) {
    _readyOrders.remove(order);
    notifyListeners();
  }
}
