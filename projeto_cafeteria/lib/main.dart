import 'package:flutter/material.dart';

import 'package:projeto_cafeteria/screens/kitchen_page.dart'; // !!!
import 'package:projeto_cafeteria/screens/orders_page.dart';

import 'package:provider/provider.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/nav.dart';
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
        //.router <--- child: MaterialApp.router() para ter as rotas das outras telas
        title: 'Sistema de Gerenciamento de Cafeteria',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: const OrdersPage(),
        // routerConfig: AppRouter.router, <-- descomentar depois
      ),
    );
  }
}
