import 'dart:async';

import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../model/note.dart';

class GenericCrudProvider {
  static GenericCrudProvider helper = GenericCrudProvider._createInstance();
  Dio _dio = Dio();

  GenericCrudProvider._createInstance() {}

  Future<Note> getNote(String noteId) async {
    Response response = await _dio.get(
        "https://d78843cc-06c8-4651-ae83-33e8ed3d4f34-00-2h4nlxbsfxorp.spock.replit.dev/notes/$noteId");

    Note note = Note.fromMap(response.data);
    note.noteId = noteId;

    return note;
  }

  Future<String> insertNote(Note note) async {
    _dio.post(
        "https://d78843cc-06c8-4651-ae83-33e8ed3d4f34-00-2h4nlxbsfxorp.spock.replit.dev/notes",
        data: note.toMap());
    /*   
    String key = numInsertions.toString();
    note.noteId = key;
    database[key] = note;
    numInsertions++;*/

    //_controller.sink.add("1");
    return '1';
  }

  Future<String> updateNote(String noteId, Note note) async {
    _dio.put(
        'https://d78843cc-06c8-4651-ae83-33e8ed3d4f34-00-2h4nlxbsfxorp.spock.replit.dev/notes/$noteId',
        data: note.toMap());

    // note.noteId = noteId;
    // database[noteId] = note;
    //_controller.sink.add(noteId);
    return noteId;
  }

  Future<String> deleteNote(String noteId) async {
    _dio.delete(
        'https://d78843cc-06c8-4651-ae83-33e8ed3d4f34-00-2h4nlxbsfxorp.spock.replit.dev/notes/$noteId');
    // database.remove(noteId);
    //_controller.sink.add(noteId);
    return noteId;
  }

  Future<List<Note>> getNoteList() async {
    Response response = await _dio.get(
        "https://d78843cc-06c8-4651-ae83-33e8ed3d4f34-00-2h4nlxbsfxorp.spock.replit.dev/notes");

    List<Note> noteList = [];

    response.data.forEach((key, value) {
      Note note = Note.fromMap(value);
      note.noteId = key;
      noteList.add(note);
    });

    return noteList;
  }

  StreamController? _controller;

  Stream get stream {
    if (_controller == null) {
      _controller = StreamController();

      Socket socket = io(
          'https://d78843cc-06c8-4651-ae83-33e8ed3d4f34-00-2h4nlxbsfxorp.spock.replit.dev',
          OptionBuilder().setTransports(['websocket']).build());

          socket.on('server_information', (data) {
            _controller!.sink.add(data);
          });
    }

    return _controller!.stream;
  }
}
