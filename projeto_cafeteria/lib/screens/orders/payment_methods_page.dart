import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/config/routes.dart'; // Importante para puxar o Routes

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Recebe o total que foi enviado da OrderSummaryPage
    final double total =
        ModalRoute.of(context)?.settings.arguments as double? ?? 0.0;

    final List<Map<String, dynamic>> methods = [
      {'name': 'PIX', 'icon': Icons.pix},
      {'name': 'Credit Card', 'icon': Icons.credit_card},
      {'name': 'Debit Card', 'icon': Icons.contactless},
      {'name': 'Cash', 'icon': Icons.payments},
    ];

    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        title: const Text(
          "Payment",
          style: TextStyle(
            color: CoffeeColors.cream,
            fontFamily: AppFonts.mainFont,
          ),
        ),
        backgroundColor: CoffeeColors.coffeeLight,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: CoffeeColors.cream),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              "Select payment method",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CoffeeColors.coffeeDark,
                fontFamily: AppFonts.mainFont,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: methods.length,
                itemBuilder: (context, index) {
                  final method = methods[index];

                  return Card(
                    color: CoffeeColors.coffeeLight, // Card no padrão do app
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      leading: Icon(
                        method['icon'],
                        color: CoffeeColors.cream,
                        size: 28,
                      ),
                      title: Text(
                        method['name'],
                        style: const TextStyle(
                          color: CoffeeColors.cream,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: AppFonts.mainFont,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: CoffeeColors.cream,
                      ),
                      onTap: () {
                        // 2. Manda o pacote para a tela de processamento
                        Navigator.pushNamed(
                          context,
                          Routes
                              .paymentProcessing, // Certifique-se que essa variável existe no config/routes.dart!
                          arguments: {'total': total, 'method': method['name']},
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
