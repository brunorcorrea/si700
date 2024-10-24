import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../model/note.dart';

class GenericCrudProvider {
  static GenericCrudProvider helper = GenericCrudProvider._createInstance();
  Dio _dio = Dio();

  final CollectionReference noteCollection =
      FirebaseFirestore.instance.collection("notes");

  String uid = "default";

  GenericCrudProvider._createInstance();

  Future<Note> getNote(String noteId) async {
    DocumentSnapshot response = await noteCollection.doc(uid).collection("my_notes").doc(noteId).get();

    Note note = Note.fromMap(response.data());
    note.noteId = noteId;

    return note;
  }

  Future<String> insertNote(Note note) async {
    noteCollection.doc(uid).collection("my_notes").add(note.toMap());
    return '1';
  }

  Future<String> updateNote(String noteId, Note note) async {
    noteCollection
        .doc(uid)
        .collection("my_notes")
        .doc(noteId)
        .update(note.toMap());
    return noteId;
  }

  Future<String> deleteNote(String noteId) async {
    noteCollection.doc(uid).collection("my_notes").doc(noteId).delete();
    return noteId;
  }

  Future<List<Note>> getNoteList() async {
    QuerySnapshot querySnapshot = await noteCollection.doc(uid).collection("my_notes").get();

    List<Note> noteList = [];

    querySnapshot.docs.forEach((doc) {
      Note note = Note.fromMap(doc.data());
      note.noteId = doc.id;
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
