import 'package:sl11/model/answer.dart';

class AnswerCollection {
  List<String> idList;
  List<Answer> answerList;

  AnswerCollection()
      : idList = [],
        answerList = [];

  length() {
    return answerList.length;
  }

  getAnswerAtIndex(int i) {
    return answerList[i];
  }

  getIdAtIndex(int i) {
    return idList[i];
  }

  getIndexOfId(String id) {
    return idList.indexOf(id);
  }

  updateAnswerOfId(String id, Answer answer) {
    int index = idList.indexOf(id);
    answerList[index] = answer;
  }

  deleteAnswerOfId(String id) {
    int index = idList.indexOf(id);
    idList.removeAt(index);
    answerList.removeAt(index);
  }

  insertAnswerOfId(String id, Answer answer) {
    if (idList.contains(id)) {
      updateAnswerOfId(id, answer);
      return;
    }

    idList.add(id);
    answerList.add(answer);
  }

  void updateOrInsertAnswerOfId(String id, Answer answer) {
    int index = getIndexOfId(id);
    if (index != -1) {
      answerList[index] = answer;
    } else {
      idList.add(id);
      answerList.add(answer);
    }
  }
}
