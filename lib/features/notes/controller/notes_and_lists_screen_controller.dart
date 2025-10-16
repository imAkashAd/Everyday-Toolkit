import 'package:get/get.dart';

// Note model
class Note {
  final int id;
  String title;
  String content;
  bool pinned;
  DateTime updatedAt;

  Note({
    required this.id,
    required this.title,
    required this.content,
    this.pinned = false,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();
}

// Checklist item model
class CheckItem {
  final int id;
  String text;
  bool done;
  CheckItem({required this.id, required this.text, this.done = false});
}

// List model (a collection of CheckItem)
class NoteList {
  final int id;
  String title;
  List<CheckItem> items;
  DateTime updatedAt;

  NoteList({
    required this.id,
    required this.title,
    List<CheckItem>? items,
    DateTime? updatedAt,
  })  : items = items ?? [],
        updatedAt = updatedAt ?? DateTime.now();
}

class NotesAndListsScreenController extends GetxController {
  final notes = <Note>[].obs;
  final lists = <NoteList>[].obs;

  int _noteId = 0;
  int _listId = 0;
  int _itemId = 0;

  // Notes methods
  Note addNote(String title, String content) {
    final note = Note(id: ++_noteId, title: title, content: content);
    notes.insert(0, note);
    return note;
  }

  bool updateNote(int id, {String? title, String? content}) {
    final idx = notes.indexWhere((n) => n.id == id);
    if (idx == -1) return false;
    final n = notes[idx];
    n.title = title ?? n.title;
    n.content = content ?? n.content;
    n.updatedAt = DateTime.now();
    notes[idx] = n; // trigger update
    return true;
  }

  bool deleteNote(int id) {
    final idx = notes.indexWhere((n) => n.id == id);
    if (idx == -1) return false;
    notes.removeAt(idx);
    return true;
  }

  bool togglePin(int id) {
    final idx = notes.indexWhere((n) => n.id == id);
    if (idx == -1) return false;
    final n = notes[idx];
    n.pinned = !n.pinned;
    n.updatedAt = DateTime.now();
    // keep pinned notes at top
    notes.removeAt(idx);
    if (n.pinned) {
      notes.insert(0, n);
    } else {
      notes.add(n);
    }
    return true;
  }

  // Lists methods
  NoteList addList(String title) {
    final l = NoteList(id: ++_listId, title: title);
    lists.insert(0, l);
    return l;
  }

  bool deleteList(int id) {
    final idx = lists.indexWhere((l) => l.id == id);
    if (idx == -1) return false;
    lists.removeAt(idx);
    return true;
  }

  bool addItemToList(int listId, String text) {
    final idx = lists.indexWhere((l) => l.id == listId);
    if (idx == -1) return false;
    final item = CheckItem(id: ++_itemId, text: text);
    final l = lists[idx];
    l.items.insert(0, item);
    l.updatedAt = DateTime.now();
    lists[idx] = l; // trigger update
    return true;
  }

  bool toggleItemDone(int listId, int itemId) {
    final idx = lists.indexWhere((l) => l.id == listId);
    if (idx == -1) return false;
    final l = lists[idx];
    final itIdx = l.items.indexWhere((it) => it.id == itemId);
    if (itIdx == -1) return false;
    final it = l.items[itIdx];
    it.done = !it.done;
    l.updatedAt = DateTime.now();
    lists[idx] = l; // trigger update
    return true;
  }

  bool deleteItem(int listId, int itemId) {
    final idx = lists.indexWhere((l) => l.id == listId);
    if (idx == -1) return false;
    final l = lists[idx];
    final beforeLen = l.items.length;
    l.items.removeWhere((it) => it.id == itemId); // removeWhere returns void
    final removed = beforeLen != l.items.length;
    if (removed) {
      l.updatedAt = DateTime.now();
      lists[idx] = l; // trigger update
    }
    return removed;
  }
}