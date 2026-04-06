import 'package:flutter/material.dart';
import 'package:projeto_cafeteria/models/inventory_item.dart';
import 'package:projeto_cafeteria/screens/inventory/inventory_edit.dart';
import 'package:projeto_cafeteria/stores/inventory_store.dart';

class InventoryFilterList extends StatefulWidget {
  const InventoryFilterList({super.key});

  @override
  State<InventoryFilterList> createState() => _InventoryFilterListState();
}

class _InventoryFilterListState extends State<InventoryFilterList> {
  String _searchQuery = '';
  bool _showOnlyLowStock = false;

  List<InventoryItem> get _filteredItems {
    List<InventoryItem> items = InventoryStore.getAll();

    if (_showOnlyLowStock) {
      items = items.where((item) => item.isLowStock || item.isOutOfStock).toList();
    }

    if (_searchQuery.isNotEmpty) {
      items = items.where((item) => 
        item.name.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final itemsToDisplay = _filteredItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search by name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            
            const SizedBox(height: 8),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Only low stock'),
              value: _showOnlyLowStock,
              onChanged: (value) {
                setState(() {
                  _showOnlyLowStock = value;
                });
              },
            ),

            const Divider(height: 24),
            
            Expanded(
              child: itemsToDisplay.isEmpty
                  ? const Center(child: Text('0 items found.'))
                  : ListView.builder(
                      itemCount: itemsToDisplay.length,
                      itemBuilder: (context, index) {
                        final item = itemsToDisplay[index];

                        return Card(
                          elevation: 1,
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text(item.name),
                            subtitle: Text(
                              'Category: ${item.category.name}\n'
                              'Now: ${item.quantity} ${item.unit.name} (Min: ${item.minQuantity})'
                            ),
                            isThreeLine: true,
                            trailing: IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InventoryEditPage(item: item),
                                  ),
                                );
                              },
                            ),
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