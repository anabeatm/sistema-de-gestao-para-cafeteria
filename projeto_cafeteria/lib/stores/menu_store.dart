import 'package:projeto_cafeteria/models/menu_product.dart';
import 'package:projeto_cafeteria/models/enums/menu_category_enums.dart';

class MenuStore {
  static final List<MenuProduct> _items = _seed();

  static List<MenuProduct> getAll() => List.unmodifiable(_items);

  static List<MenuProduct> getByCategory(MenuCategory category) {
    return _items.where((item) => item.category == category).toList();
  }

  static List<MenuProduct> _seed() {
    return [
      MenuProduct(
        id: '1',
        name: "Espresso",
        price: 19.50,
        category: MenuCategory.hotDrinks,
        // Espresso = 15g de Coffee (ID 1) + 30ml de Water (ID 2)
        recipe: [
          RecipeIngredient(inventoryId: '1', amount: 15),
          RecipeIngredient(inventoryId: '2', amount: 30),
        ],
      ),
      MenuProduct(
        id: '2',
        name: "Capuccino",
        price: 20.00,
        category: MenuCategory.hotDrinks,
        // Capuccino = 15g Coffee (ID 1) + 30ml Water (ID 2) + 100ml Milk (ID 3) + 5g Cinnamon (ID 8)
        recipe: [
          RecipeIngredient(inventoryId: '1', amount: 15),
          RecipeIngredient(inventoryId: '2', amount: 30),
          RecipeIngredient(inventoryId: '3', amount: 100),
          RecipeIngredient(inventoryId: '8', amount: 5),
        ],
      ),
      MenuProduct(
        id: '3',
        name: "Matcha Latte",
        price: 22.00,
        category: MenuCategory.hotDrinks,
        // Matcha = 15g Green Tea (ID 7) + 150ml Milk (ID 3) + 10g Honey (ID 5)
        recipe: [
          RecipeIngredient(inventoryId: '7', amount: 15),
          RecipeIngredient(inventoryId: '3', amount: 150),
          RecipeIngredient(inventoryId: '5', amount: 10),
        ],
      ),
      MenuProduct(
        id: '11',
        name: "Americano",
        price: 15.00,
        category: MenuCategory.hotDrinks,
        recipe: [
          RecipeIngredient(inventoryId: '1', amount: 15),
          RecipeIngredient(inventoryId: '2', amount: 150),
        ],
      ),
      MenuProduct(
        id: '12',
        name: "Mocha",
        price: 23.50,
        category: MenuCategory.hotDrinks,
        recipe: [
          RecipeIngredient(inventoryId: '1', amount: 15),
          RecipeIngredient(inventoryId: '3', amount: 100),
          RecipeIngredient(inventoryId: '9', amount: 20),
        ],
      ),
      MenuProduct(
        id: '13',
        name: "Hot Chocolate",
        price: 18.00,
        category: MenuCategory.hotDrinks,
        recipe: [
          RecipeIngredient(inventoryId: '3', amount: 200),
          RecipeIngredient(inventoryId: '9', amount: 40),
        ],
      ),
      MenuProduct(
        id: '14',
        name: "Flat White",
        price: 21.00,
        category: MenuCategory.hotDrinks,
        recipe: [
          RecipeIngredient(inventoryId: '1', amount: 20),
          RecipeIngredient(inventoryId: '3', amount: 120),
        ],
      ),

      MenuProduct(
        id: '4',
        name: "Iced Tea",
        price: 18.00,
        category: MenuCategory.coldDrinks,
        // Iced Tea = 10g Black Tea (ID 6) + 200ml Water (ID 2) + 5g Mint (ID 4)
        recipe: [
          RecipeIngredient(inventoryId: '6', amount: 10),
          RecipeIngredient(inventoryId: '2', amount: 200),
          RecipeIngredient(inventoryId: '4', amount: 5),
        ],
      ),
      MenuProduct(
        id: '5',
        name: "Orange Juice",
        price: 12.00,
        category: MenuCategory.coldDrinks,
      ),
      MenuProduct(
        id: '15',
        name: "Cold Brew",
        price: 22.00,
        category: MenuCategory.coldDrinks,
        recipe: [
          RecipeIngredient(inventoryId: '1', amount: 30),
          RecipeIngredient(inventoryId: '2', amount: 200),
        ],
      ),
      MenuProduct(
        id: '16',
        name: "Iced Latte",
        price: 24.00,
        category: MenuCategory.coldDrinks,
        recipe: [
          RecipeIngredient(inventoryId: '1', amount: 15),
          RecipeIngredient(inventoryId: '3', amount: 150),
        ],
      ),
      MenuProduct(
        id: '17',
        name: "Lemonade",
        price: 14.00,
        category: MenuCategory.coldDrinks,
      ),
      MenuProduct(
        id: '18',
        name: "Frappuccino",
        price: 28.00,
        category: MenuCategory.coldDrinks,
        recipe: [
          RecipeIngredient(inventoryId: '1', amount: 15),
          RecipeIngredient(inventoryId: '3', amount: 100),
          RecipeIngredient(inventoryId: '9', amount: 20),
        ],
      ),

      // Comidas prontas (não gastam ingredientes crus do estoque, vamos deixar sem recipe)
      MenuProduct(
        id: '6',
        name: "Croissant",
        price: 12.00,
        category: MenuCategory.savorySnacks,
      ),
      MenuProduct(
        id: '7',
        name: "Cheese Bread",
        price: 8.00,
        category: MenuCategory.savorySnacks,
      ),
      MenuProduct(
        id: '19',
        name: "Empanada",
        price: 14.00,
        category: MenuCategory.savorySnacks,
      ),
      MenuProduct(
        id: '20',
        name: "Avocado Toast",
        price: 22.00,
        category: MenuCategory.savorySnacks,
      ),
      MenuProduct(
        id: '21',
        name: "Turkey Sandwich",
        price: 25.00,
        category: MenuCategory.savorySnacks,
      ),
      MenuProduct(
        id: '22',
        name: "Quiche Lorraine",
        price: 18.00,
        category: MenuCategory.savorySnacks,
      ),

      MenuProduct(
        id: '8',
        name: "Chocolate Cookie",
        price: 8.00,
        category: MenuCategory.sweets,
      ),
      MenuProduct(
        id: '9',
        name: "Oreo Cheesecake",
        price: 25.00,
        category: MenuCategory.sweets,
      ),
      MenuProduct(
        id: '10',
        name: "Lemon Cheesecake",
        price: 27.00,
        category: MenuCategory.sweets,
      ),
      MenuProduct(
        id: '23',
        name: "Fudge Brownie",
        price: 14.00,
        category: MenuCategory.sweets,
      ),
      MenuProduct(
        id: '24',
        name: "Cinnamon Roll",
        price: 16.00,
        category: MenuCategory.sweets,
      ),
      MenuProduct(
        id: '25',
        name: "Carrot Cake",
        price: 18.00,
        category: MenuCategory.sweets,
      ),
      MenuProduct(
        id: '26',
        name: "Red Velvet Muffin",
        price: 12.00,
        category: MenuCategory.sweets,
      ),
    ];
  }
}
