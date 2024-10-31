import 'package:flutter/masterial.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:si700/bloc/question_bloc.dart';
import 'package:si700/model/question.dart';
import 'package:sl11/bloc/answer_manager.dart';
import 'package:sl11/model/question.dart';

class QuestionRadioButtonField extends StatelessWidget {
  final Question question;
  final int questionIndex;

  QuestionRadioButtonField(
      {required this.question, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        if (question.subtitle != null)
          Text(
            question.subtitle!,
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
        SizedBox(height: 10),
        _buildRadioList(context),
      ],
    );
  }

  Widget _buildRadioList(BuildContext context) {
    return BlocBuilder<ManageBloc, ManageState>(
      builder: (context, state) {
        int answer = state.answers.getAnswer(questionIndex);
        return Column(
          children: question.alternatives
              .asMap()
              .entries
              .map((entry) =>
                  _buildRadioTile(context, entry.key, entry.value, answer))
              .toList(),
        );
      },
    );
  }
}
