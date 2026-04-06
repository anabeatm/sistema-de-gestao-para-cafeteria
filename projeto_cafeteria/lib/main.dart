import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/screens/home_page.dart';
import 'package:projeto_cafeteria/screens/inventory/inventory_add.dart';
import 'package:projeto_cafeteria/screens/inventory/inventory_edit.dart';
import 'package:projeto_cafeteria/screens/inventory/inventory_list.dart';
import 'package:projeto_cafeteria/screens/inventory/inventory_lowstock.dart';
import 'package:projeto_cafeteria/screens/inventory/inventory_movement.dart';
import 'package:projeto_cafeteria/screens/inventory/inventory_page.dart';

import 'package:projeto_cafeteria/screens/kitchen/kitchen_page.dart';
import 'package:projeto_cafeteria/screens/kitchen/pending_orders_page.dart';
import 'package:projeto_cafeteria/screens/kitchen/preparing_orders_page.dart';
import 'package:projeto_cafeteria/screens/kitchen/ready_orders_page.dart'; // !!!

import 'package:projeto_cafeteria/screens/orders/orders_page.dart';
import 'package:projeto_cafeteria/screens/orders/new_order_page.dart';
import 'package:projeto_cafeteria/screens/orders/table_selection_page.dart';
import 'package:projeto_cafeteria/screens/orders/order_categories_page.dart';
import 'package:projeto_cafeteria/screens/orders/product_datail_page.dart';
import 'package:projeto_cafeteria/screens/orders/success_order_page.dart';
import 'package:projeto_cafeteria/screens/orders/order_sumary_page.dart';
import 'package:projeto_cafeteria/models/menu_product.dart';

import 'package:projeto_cafeteria/config/routes.dart';

import 'package:provider/provider.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/services/product_service.dart';
import 'package:projeto_cafeteria/services/order_service.dart';
import 'package:projeto_cafeteria/services/inventory_service.dart';
import 'package:projeto_cafeteria/services/user_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // compartilhando estados entre diferentes telas
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductService(),
        ), // cria instancias das classes
        ChangeNotifierProvider(create: (_) => OrderService()),
        ChangeNotifierProvider(create: (_) => InventoryService()),
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        title: 'Sistema de Gerenciamento de Cafeteria',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        routes: {
          Routes.home: (context) => const HomePage(),
          Routes.inventory: (context) => const InventoryPage(),
          Routes.inventoryList: (context) => const InventoryList(),
          Routes.lowStock: (context) => const LowStockPage(),
          Routes.inventoryAdd: (context) => const InventoryAddPage(),
          
          Routes.inventoryEdit: (context) => const InventoryEditPage(),
          Routes.inventoryMovement: (context) => const InventoryMovementPage(),
          // Routes.inventoryStock: (context) => const InventoryStockPage(),
          // Routes.inventoryHistory: (context) => const InventoryHistoryPage(),
          // Routes.filteredList: (context) => const FilteredListPage(),
          // Routes.consumptionReport: (context) => const ConsumptionReportPage(),
          Routes.orders: (context) => const OrdersPage(),
          Routes.newOrder: (context) => const NewOrderPage(),
          Routes.tableSelection: (context) => const TableSelectionPage(),
          Routes.categories: (context) => const CategoriesPage(),
          Routes.success: (context) => const SuccessPage(),
          Routes.productDetail: (context) => const ProductDetailPage(),
          Routes.itemsSummary: (context) {
            final order =
                ModalRoute.of(context)!.settings.arguments as List<MenuProduct>;
            return OrderSummaryPage(order: order);
          },
          Routes.kitchen: (context) => const KitchenPage(),
          Routes.pendingOrders: (context) => const PendingOrdersPage(),
          Routes.preparingOrders: (context) => const PreparingOrdersPage(),
          Routes.readyOrders: (context) => const ReadyOrdersPage(),

          // Routes.menu: (context) => const MenuPage(),
        },
      ),
    );
  }
}
