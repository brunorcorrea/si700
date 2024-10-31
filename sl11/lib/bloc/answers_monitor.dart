import 'package:sl11/data/generic_data_provider.dart';
import 'package:sl11/model/answer.dart';
import 'package:sl11/model/answer_collection.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  MonitorBloc() : super(MonitorState(answerCollection: AnswerCollection())) {
    on<AskNewList>(_onAskNewList);
    on<UpdateList>(_onUpdateList);

    GenericDataProvider.helper.stream.listen((event) {
      String answerId = event[0];
      Answer answer = event[1];

      state.answerCollection.updateOrInsertAnswerOfId(answerId, answer);
      add(UpdateList());
    });

    add(AskNewList());
  }

  Future<void> _onAskNewList(
      AskNewList event, Emitter<MonitorState> emit) async {
    var newCollection = await GenericDataProvider.helper.getAllAnswers();

    emit(MonitorState(answerCollection: newCollection));
  }

  void _onUpdateList(UpdateList event, Emitter<MonitorState> emit) {
    var currentCollection = state.answerCollection;
    emit(MonitorState(answerCollection: currentCollection));
  }
}

abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {}

class MonitorState {
  AnswerCollection answerCollection;
  MonitorState({required this.answerCollection});
}
