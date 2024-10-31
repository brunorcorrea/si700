import 'dart:async';

import 'package:sl11/model/answer.dart';
import 'package:sl11/model/answer_collection.dart';

class GenericDataProvider {
  int numInsertions = 0;
  final Map<String, List> _database = {};
  final StreamController _controller = StreamController.broadcast();
  static GenericDataProvider helper =
      GenericDataProvider(); //TODO create a private constructor

  Future<String> insertAnswer(Answer answer) {
    String answerId = "answer$numInsertions";
    _database[answerId] = answer.answerList;
    numInsertions++;

    notify(answerId, answer);

    return Future.value(answerId);
  }

  Future<String> updateAnswer(String answerId, Answer answer) async {
    if (_database.containsKey(answerId)) {
      _database[answerId] = answer.answerList;
      notify(answerId, answer);
      return Future.value(answerId);
    } else {
      throw Exception("Answer ID not found");
    }
  }

  Future<String> deleteAnswer(String answerId) async {
    if (_database.containsKey(answerId)) {
      _database.remove(answerId);
      notify(answerId, null);
      return Future.value(answerId);
    } else {
      throw Exception("Answer ID not found");
    }
  }

  Future<Answer> getAnswer(String answerId) async {
    if (_database.containsKey(answerId)) {
      return Future.value(Answer.withData(
          answerList: _database[answerId] as List<List<dynamic>>));
    } else {
      return Future.value(Answer(numQuestions: 0));
    }
  }

  Future<AnswerCollection> getAllAnswers() async {
    AnswerCollection answerCollection = AnswerCollection();
    _database.forEach((answerId, answerList) {
      answerCollection.insertAnswerOfId(answerId,
          Answer.withData(answerList: answerList as List<List<dynamic>>));
    });
    return Future.value(answerCollection);
  }

  void notify(String answerId, Answer? answer) {
    _controller.add({answerId: answer});
  }

  Stream get stream => _controller.stream;
}
