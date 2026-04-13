import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/config/routes.dart';

class PaymentProcessingPage extends StatefulWidget {
  final double total;
  final String method;

  const PaymentProcessingPage({
    super.key,
    required this.total,
    required this.method,
  });

  @override
  State<PaymentProcessingPage> createState() => _PaymentProcessingPageState();
}

class _PaymentProcessingPageState extends State<PaymentProcessingPage> {
  final TextEditingController _cashController = TextEditingController();
  double _amountReceived = 0.0;

  @override
  void dispose() {
    _cashController.dispose();
    super.dispose();
  }

  double get _change {
    if (_amountReceived >= widget.total) {
      return _amountReceived - widget.total;
    }
    return 0.0;
  }

  bool get _canConfirm {
    if (widget.method == 'Cash') {
      return _amountReceived >= widget.total;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      appBar: AppBar(
        title: Text("Payment: ${widget.method}"),
        backgroundColor: CoffeeColors.coffeeLight,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CoffeeColors.coffeeLight,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    "Total Amount",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "R\$ ${widget.total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.mainFont,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            Expanded(child: _buildPaymentInterface()),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CoffeeColors.coffeeLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBackgroundColor: Colors.grey[400],
                ),
                onPressed: _canConfirm
                    ? () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.success,
                          (route) => false,
                        );
                      }
                    : null,
                child: const Text(
                  "Confirm Payment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentInterface() {
    if (widget.method == 'Pix') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: CoffeeColors.coffeeLight, width: 2),
            ),
            child: const Icon(
              Icons.qr_code_2,
              size: 180,
              color: CoffeeColors.coffeeDark,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Waiting for customer scan...",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CoffeeColors.coffeeBrown,
            ),
          ),
        ],
      );
    } else if (widget.method.contains('Card')) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.credit_score, size: 120, color: CoffeeColors.coffeeLight),
          SizedBox(height: 20),
          Text(
            "Follow instructions on the terminal.",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: CoffeeColors.coffeeLight,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Press Confirm after approved.",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      );
    } else if (widget.method == 'Cash') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _cashController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CoffeeColors.coffeeLight,
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: "Amount Received (R\$)",
              labelStyle: const TextStyle(color: CoffeeColors.coffeeLight),
              filled: true,
              fillColor: CoffeeColors.beige,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: CoffeeColors.coffeeDark,
                  width: 2,
                ),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _amountReceived =
                    double.tryParse(value.replaceAll(',', '.')) ?? 0.0;
              });
            },
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: _change > 0 ? Colors.green[100] : CoffeeColors.latte,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Change to return:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CoffeeColors.coffeeDark,
                  ),
                ),
                Text(
                  "R\$ ${_change.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: _change > 0
                        ? Colors.green[800]
                        : CoffeeColors.coffeeDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return const SizedBox();
  }
}
