import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/notes_and_lists_screen_controller.dart';

class NotesTab extends StatelessWidget {
  final void Function(Note note)? onEditNote;
  const NotesTab({super.key, this.onEditNote});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<NotesAndListsScreenController>();
    return Obx(() {
      final notes = ctrl.notes;
      if (notes.isEmpty) return const Center(child: Text('No notes yet'));
      return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (_, i) {
          final n = notes[i];
          return Card(
            child: ListTile(
              leading: IconButton(
                icon: Icon(n.pinned ? Icons.push_pin : Icons.push_pin_outlined),
                onPressed: () => ctrl.togglePin(n.id),
              ),
              title: Text(n.title.isNotEmpty ? n.title : '(No title)'),
              subtitle: Text(n.content, maxLines: 2, overflow: TextOverflow.ellipsis),
              onTap: () => onEditNote?.call(n),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => ctrl.deleteNote(n.id),
              ),
            ),
          );
        },
      );
    });
  }
}
