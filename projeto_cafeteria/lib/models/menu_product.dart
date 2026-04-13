import 'package:projeto_cafeteria/models/enums/menu_category_enums.dart';

// 1. Criamos essa classe minúscula para mapear a receita
class RecipeIngredient {
  final String inventoryId; // O ID do item lá no estoque do seu amigo
  final double amount; // Quanto gasta (ex: 15g)

  RecipeIngredient({required this.inventoryId, required this.amount});
}

class MenuProduct {
  final String id;
  final String name;
  final double price;
  final MenuCategory category;
  int quantity;

  // 2. Adicionamos a lista de ingredientes na receita
  final List<RecipeIngredient> recipe;

  MenuProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    this.quantity = 0,
    this.recipe =
        const [], // 3. Por padrão é vazia, para não quebrar o código antigo
  });

  MenuProduct copyWith({int? quantity}) {
    return MenuProduct(
      id: id,
      name: name,
      price: price,
      category: category,
      quantity: quantity ?? this.quantity,
      recipe: recipe, // 4. Repassa a receita no copy
    );
  }
}
