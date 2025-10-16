import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/notes_and_lists_screen_controller.dart';

class ListsTab extends StatelessWidget {
  const ListsTab({super.key});

  Future<void> _showAddItemDialog(BuildContext context, int listId) async {
    final itemC = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Item'),
        content: TextField(controller: itemC, decoration: const InputDecoration(labelText: 'Item text')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              final t = itemC.text.trim();
              if (t.isEmpty) return;
              Get.find<NotesAndListsScreenController>().addItemToList(listId, t);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<NotesAndListsScreenController>();
    return Obx(() {
      final lists = ctrl.lists;
      if (lists.isEmpty) return const Center(child: Text('No lists yet'));
      return ListView.builder(
        itemCount: lists.length,
        itemBuilder: (_, i) {
          final l = lists[i];
          return Card(
            child: ExpansionTile(
              title: Text(l.title),
              subtitle: Text('${l.items.length} item(s)'),
              children: [
                for (final it in l.items)
                  ListTile(
                    leading: Checkbox(
                      value: it.done,
                      onChanged: (_) => ctrl.toggleItemDone(l.id, it.id),
                    ),
                    title: Text(
                      it.text,
                      style: TextStyle(decoration: it.done ? TextDecoration.lineThrough : null),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => ctrl.deleteItem(l.id, it.id),
                    ),
                  ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () => _showAddItemDialog(context, l.id),
                    icon: const Icon(Icons.add),
                    label: const Text('Add item'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () => ctrl.deleteList(l.id), child: const Text('Delete list')),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
