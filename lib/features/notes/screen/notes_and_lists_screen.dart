import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/notes_and_lists_screen_controller.dart';
import '../widgets/lists_tab.dart';
import '../widgets/notes_tab.dart';

class NotesAndListsScreen extends StatelessWidget {
  const NotesAndListsScreen({super.key});

  NotesAndListsScreenController get _ctrl {
    if (!Get.isRegistered<NotesAndListsScreenController>()) {
      Get.put(NotesAndListsScreenController());
    }
    return Get.find<NotesAndListsScreenController>();
  }

  Future<void> _showNoteDialog(BuildContext context, {Note? note}) async {
    final titleC = TextEditingController(text: note?.title ?? '');
    final contentC = TextEditingController(text: note?.content ?? '');
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(note == null ? 'Add Note' : 'Edit Note'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleC, decoration: const InputDecoration(labelText: 'Title')),
            TextField(controller: contentC, decoration: const InputDecoration(labelText: 'Content')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              final t = titleC.text.trim();
              final c = contentC.text.trim();
              if (t.isEmpty && c.isEmpty) return;
              if (note == null) {
                _ctrl.addNote(t, c);
              } else {
                _ctrl.updateNote(note.id, title: t, content: c);
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddListDialog(BuildContext context) async {
    final titleC = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('New List'),
        content: TextField(controller: titleC, decoration: const InputDecoration(labelText: 'List title')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              final t = titleC.text.trim();
              if (t.isEmpty) return;
              _ctrl.addList(t);
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ensure controller
    _ctrl;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes & Lists'),
          bottom: const TabBar(tabs: [Tab(text: 'Notes'), Tab(text: 'Lists')]),
        ),
        body: TabBarView(children: [
          NotesTab(onEditNote: (note) => _showNoteDialog(context, note: note)),
          ListsTab(), // lists tab handles its own dialogs for items
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // changed: use maybeOf to avoid assertion when DefaultTabController isn't in the tree
            final tabIndex = DefaultTabController.maybeOf(context)?.index ?? 0;
            if (tabIndex == 0) {
              _showNoteDialog(context);
            } else {
              _showAddListDialog(context);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}