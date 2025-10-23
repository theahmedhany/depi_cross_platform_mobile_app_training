import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/note.dart';

class StorageService {
  static const String _notesKey = 'notes';

  Future<List<Note>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final String? notesJson = prefs.getString(_notesKey);

    if (notesJson == null) return [];

    final List<dynamic> notesList = jsonDecode(notesJson);
    return notesList.map((json) => Note.fromJson(json)).toList();
  }

  Future<void> saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final String notesJson = jsonEncode(
      notes.map((note) => note.toJson()).toList(),
    );
    await prefs.setString(_notesKey, notesJson);
  }

  Future<void> addNote(Note note, List<Note> currentNotes) async {
    currentNotes.insert(0, note);
    await saveNotes(currentNotes);
  }

  Future<void> updateNote(Note note, List<Note> currentNotes) async {
    final index = currentNotes.indexWhere((n) => n.id == note.id);
    if (index != -1) {
      currentNotes[index] = note;
      await saveNotes(currentNotes);
    }
  }

  Future<void> deleteNote(String noteId, List<Note> currentNotes) async {
    currentNotes.removeWhere((note) => note.id == noteId);
    await saveNotes(currentNotes);
  }
}
