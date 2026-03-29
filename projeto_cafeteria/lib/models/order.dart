import 'table.dart';
import 'order_item.dart';
import 'item.dart';

class Order {
  final int? id;
  final Table table;
  final List<OrderItem> items;

  Order({this.id, required this.table, required this.items});

  ///summary
  ///Calcular o preço total do pedido
  ///summary
  double get orderPrice {
    double pricesSum = 0.0;
    for (var item in items) {
      pricesSum += item.subTotal;
    }
    return pricesSum;
  }

  ///summary
  ///Verifica se adiciona ou incrimenta a lista de pedidios
  ///(cria um novo objeto por ser padrão do Flutter)
  ///summary
  void incrementOrAdd(OrderItem orderItem) {
    var index = items.indexWhere((item) => item.id == orderItem.id);
    if (index != -1) {
      items[index] = items[index].copyWith(
        quantity: items[index].getQuantity + 1,
      );
    } else {
      items.add(orderItem);
    }
  }

  ///<<summary>>
  ///remover ou decrementar lista de pedidos
  ///<<summary>>
  void decrementOrRemove(Item itemRemove) {
    var indexRemove = items.indexWhere((item) => item.item.id == itemRemove.id);
    if (indexRemove != -1) {
      var quantity = items[indexRemove].getQuantity;
      var currentOrderItem = items[indexRemove];

      if (quantity == 1) {
        items.removeAt(indexRemove);
      } else {
        items[indexRemove] = currentOrderItem.copyWith(
          quantity: currentOrderItem.getQuantity - 1,
        );
      }
    }

    // for (int i = 0; i < items.length; i++) {
    //   var item = items[i].item;
    //   if (item.id == itemRemove.getId) {
    //     int quantity = items[i].getQuantity;
    //     if (quantity == 1) {
    //       items.removeAt(i);
    //     } else {
    //       items[i] = items[i].copyWith(quantity: items[i].getQuantity - 1);
    //     }
    //   }
    // }
  }
}
