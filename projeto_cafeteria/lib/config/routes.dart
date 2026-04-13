class Routes {
  static String home = '/';

  static String inventory = '/inventory';
  static String inventoryList = '/inventory/list';
  static String lowStock = '/inventory/low-stock-list';
  static String inventoryAdd = '/inventory/add';
  static String inventoryEdit = '/inventory/edit';
  static const inventoryFilteredList = '/inventory/filtered';
  static const inventoryReport = '/inventory/self-report';

  static String orders = '/orders';
  static String newOrder = '/orders/new';
  static String tableSelection = '/table-selection';
  static String categories = '/order-categories';
  static String success = '/success-order';
  static String productDetail = '/product-detail';
  static String itemsSummary = '/inventory/report';
  static const String paymentMethods = '/payment-methods';
  static const String paymentProcessing = '/payment-processing';
  static const String ordersDashboard = '/orders-dashboard';
  static const String menuPage = '/menu-page';

  static String kitchen = '/kitchen/kitchen_page';
  static String pendingOrders = '/kitchen/pending_orders_page';
  static String preparingOrders = '/kitchen/preparing_orders_page';
  static String readyOrders = '/kitchen/ready_orders_page';

  static String menu = '/menu';
}
