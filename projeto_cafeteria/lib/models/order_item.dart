import 'item.dart';

class OrderItem {
  final int? id;
  final Item item;
  final int quantity;
  final double price;
  final String? observations;

  OrderItem({
    this.id,
    required this.item,
    required this.quantity,
    required this.price,
    this.observations,
  });

  double get subTotal {
    return price * quantity;
  }

  int get getQuantity => quantity;

  Item get getItem => item;

  ///summary
  ///cria uma copia do objeto com os parametros passados
  ///pois como é final não é possivel modificar os parametros ja criados
  ///summary
  OrderItem copyWith({
    Item? item,
    int? quantity,
    double? price,
    String? observations,
  }) {
    return OrderItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      observations: observations ?? this.observations,
    );
  }
}
