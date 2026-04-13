import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/theme.dart';
import 'package:projeto_cafeteria/config/routes.dart'; // Importante adicionar isso!

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColors.cream,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 120,
              color:
                  Colors.green, // Pode manter verde que dá sensação de sucesso!
            ),
            const SizedBox(height: 24),
            const Text(
              "Order Sent!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: CoffeeColors.coffeeDark,
                fontFamily: AppFonts.mainFont,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "The order is being prepared by the kitchen.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: CoffeeColors.coffeeBrown,
                  fontFamily: AppFonts.mainFont,
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 250,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CoffeeColors.coffeeBrown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Em vez de dar 'pop', a gente força abrir a rota inicial do zero!
                  // OBS: Confirme se a sua rota inicial chama Routes.home ou '/', e ajuste aqui se precisar.
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/', // Se a sua constante for Routes.home, troque para Routes.home
                    (route) => false,
                  );
                },
                child: const Text(
                  "Back to Dashboard",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
}
