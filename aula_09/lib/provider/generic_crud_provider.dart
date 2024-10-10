import 'dart:async';

import 'package:dio/dio.dart';

import '../model/note.dart';

class GenericCrudProvider {
  static GenericCrudProvider helper = GenericCrudProvider._createInstance();
  Dio _dio = Dio();

  GenericCrudProvider._createInstance() {}

  Future<Note> getNote(String noteId) async {
    Response response = await _dio
        .get("https://si700-b260759-default-rtdb.firebaseio.com/$noteId/.json");

    Note note = Note.fromMap(response.data);
    note.noteId = noteId;

    return note;
  }

  Future<String> insertNote(Note note) async {
    _dio.post("https://si700-b260759-default-rtdb.firebaseio.com/.json",
        data: note.toMap());
    /*   
    String key = numInsertions.toString();
    note.noteId = key;
    database[key] = note;
    numInsertions++;*/

    _controller.sink.add("1");
    return '1';
  }

  Future<String> updateNote(String noteId, Note note) async {
    _dio.put("https://si700-b260759-default-rtdb.firebaseio.com/$noteId/.json",
        data: note.toMap());

    // note.noteId = noteId;
    // database[noteId] = note;
    _controller.sink.add(noteId);
    return noteId;
  }

  Future<String> deleteNote(String noteId) async {
    _dio.delete(
        "https://si700-b260759-default-rtdb.firebaseio.com/$noteId/.json");
    // database.remove(noteId);
    _controller.sink.add(noteId);
    return noteId;
  }

  Future<List<Note>> getNoteList() async {
    Response response = await _dio
        .get("https://si700-b260759-default-rtdb.firebaseio.com/.json");

    List<Note> noteList = [];

    response.data.forEach((key, value) {
      Note note = Note.fromMap(value);
      note.noteId = key;
      noteList.add(note);
    });

    return noteList;
  }

  final StreamController _controller = StreamController();

  Stream get stream {
    return _controller.stream;
  }
}
