class Routes {
  static String home = '/';

  static String inventory = '/inventory';
  static String inventoryAdd = '/inventory/add';
  static String inventoryEdit = '/inventory/edit';
  static String inventoryMovement = '/inventory/movement';
  static const inventoryStock = '/inventory/stock';
  static const inventoryHistory = '/inventory/history';
  static const lowStock = '/inventory/low-stock';
  static const filteredList = '/inventory/filtered';
  static const consumptionReport = '/inventory/report';

  static String orders = '/orders';
  static String newOrder = '/orders/new';
  static String tableSelection = '/table-selection';

  static String kitchen = '/kitchen/kitchen_page';
  static String pendingOrders = '/kitchen/pending_orders_page';
  static String preparingOrders = '/kitchen/preparing_orders_page';
  static String readyOrders = '/kitchen/ready_orders_page';

  static String menu = '/menu';
}
