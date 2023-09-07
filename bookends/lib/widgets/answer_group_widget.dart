import 'package:bookends/models/basic.dart';
import 'package:bookends/services/bookend_response_service/i_bookend_response_service.dart';
import 'package:bookends/services/bookend_service/i_bookend_service.dart';
import 'package:bookends/widgets/answer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AnswerGroupWidget extends StatefulWidget {
  const AnswerGroupWidget({
    super.key,
    required this.answerGroupId,
  });

  final String answerGroupId;

  @override
  State<AnswerGroupWidget> createState() => _AnswerGroupWidgetState();
}

class _AnswerGroupWidgetState extends State<AnswerGroupWidget> {
  final IBookendResponseService _bookendResponseService =
      GetIt.I<IBookendResponseService>();
  final IBookendService _bookendService = GetIt.I<IBookendService>();

  @override
  Widget build(BuildContext context) {
    final AnswerGroup? answerGroup = _bookendResponseService.getAnswerGroup(
      answerGroupId: widget.answerGroupId,
    );

    if (answerGroup == null) {
      return const Text('Error: No Answer Group Found');
    }

    final Questionnaire? questionnaire = _bookendService.getQuestionnaire(
      answerGroup.questionnaireId,
    );

    if (questionnaire == null) {
      return const Text('Error: No Questionnaire Found');
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: _buildAnswerWidgets(answerGroup),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildAnswerWidgets(AnswerGroup answerGroup) {
    List<Widget> widgets = [];

    for (Answer answer in answerGroup.answers) {
      widgets.add(
        Container(
          margin: const EdgeInsets.only(
            top: 16,
            // bottom: 8,
          ),
          child: AnswerWidget(
            answerId: answer.id,
          ),
        ),
      );
    }

    return widgets;
  }
}
