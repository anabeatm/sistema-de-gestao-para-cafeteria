import 'package:go_router/go_router.dart';
import 'package:projeto_cafeteria/screens/home_page.dart';
import 'package:projeto_cafeteria/screens/orders/orders_page.dart';
import 'package:projeto_cafeteria/screens/orders/new_order_page.dart';
import 'package:projeto_cafeteria/screens/kitchen_page.dart';
import 'package:projeto_cafeteria/screens/inventory/inventory_page.dart';
import 'package:projeto_cafeteria/screens/menu_page.dart';
import 'package:projeto_cafeteria/screens/user_page.dart';
import 'package:projeto_cafeteria/screens/orders/table_selection_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const HomePage()),
      ),
      GoRoute(
        path: AppRoutes.orders,
        name: 'orders',
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const OrdersPage()),
      ),
      GoRoute(
        path: AppRoutes.newOrder,
        name: 'new-order',
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const NewOrderPage()),
      ),
      GoRoute(
        path: AppRoutes.tableSelection,
        name: 'table-selection',
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const TableSelectionPage()),
      ),
      GoRoute(
        path: AppRoutes.kitchen,
        name: 'kitchen',
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const KitchenPage()),
      ),
      GoRoute(
        path: AppRoutes.inventory,
        name: 'inventory',
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const InventoryPage()),
      ),
      GoRoute(
        path: AppRoutes.menu,
        name: 'menu',
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const MenuPage()),
      ),
      GoRoute(
        path: AppRoutes.user,
        name: 'user',
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const UserPage()),
      ),
    ],
  );
}

class AppRoutes {
  static const String home = "/";
  static const String orders = '/orders';
  static const String newOrder = '/new-order';
  static const String kitchen = '/kitchen';
  static const String inventory = '/inventory';
  static const String menu = '/menu';
  static const String user = '/user';
  static const String tableSelection = '/table-section';
}
