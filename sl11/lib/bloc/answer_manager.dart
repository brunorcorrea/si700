import 'package:sl11/model/answer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sl11/data/generic_data_provider.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  int numQuestions;
  Answer answers = Answer(numQuestions: 0);
  String answerId = "";

  ManageBloc({required this.numQuestions})
      : super(ManageState.build(numQuestions)) {
    on<CreateRecord>((event, emit) async {
      final newAnswer = Answer(numQuestions: numQuestions);
      answerId = await GenericDataProvider.helper.insertAnswer(newAnswer);
      emit(ManageState(answers: newAnswer, answerId: answerId));
    });

    on<UpdateRecord>((event, emit) async {
      await GenericDataProvider.helper.getAnswer(event.answerId);
      emit(ManageState(answers: state.answers, answerId: event.answerId));
    });

    on<DeleteRecord>((event, emit) async {
      await GenericDataProvider.helper.deleteAnswer(event.answerId);
      emit(ManageState(
          answers: Answer(numQuestions: numQuestions), answerId: ""));
    });

    on<SwapAnswer>((event, emit) async {
      state.answers.swapAnswer(event.question, event.value);
      await GenericDataProvider.helper.updateAnswer(answerId, state.answers);
      emit(ManageState(answers: state.answers, answerId: state.answerId));
    });

    on<SetAnswer>((event, emit) async {
      state.answers.setAnswer(event.question, event.value);
      await GenericDataProvider.helper.updateAnswer(answerId, state.answers);
      emit(ManageState(answers: state.answers, answerId: state.answerId));
    });

    on<WriteAnswer>((event, emit) async {
      state.answers.writeAnswer(event.question, event.value);
      await GenericDataProvider.helper.updateAnswer(answerId, state.answers);
      emit(ManageState(answers: state.answers, answerId: state.answerId));
    });
  }
}

abstract class ManageEvent {}

class SwapAnswer extends ManageEvent {
  int question;
  int value;
  SwapAnswer({required this.question, required this.value});
}

class SetAnswer extends ManageEvent {
  int question;
  int value;
  SetAnswer({required this.question, required this.value});
}

class WriteAnswer extends ManageEvent {
  int question;
  String value;
  WriteAnswer({required this.question, required this.value});
}

class CreateRecord extends ManageEvent {}

class UpdateRecord extends ManageEvent {
  String answerId;
  UpdateRecord({required this.answerId});
}

class DeleteRecord extends ManageEvent {
  String answerId;
  DeleteRecord({required this.answerId});
}

class ManageState {
  late Answer answers;
  late String answerId;
  ManageState({required this.answers, required this.answerId});
  ManageState.build(int numQuestions) {
    answers = Answer(numQuestions: numQuestions);
    answerId = "";
  }
}
