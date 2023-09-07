import 'package:bookends/models/basic.dart';
import 'package:bookends/widgets/question_widget.dart';
import 'package:flutter/material.dart';

class QuestionnaireWidget extends StatefulWidget {
  const QuestionnaireWidget({
    super.key,
    required this.questionnaire,
    this.isResponse = false,
  });

  final Questionnaire questionnaire;
  final bool isResponse;

  @override
  State<QuestionnaireWidget> createState() => _QuestionnaireWidgetState();
}

class _QuestionnaireWidgetState extends State<QuestionnaireWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.questionnaire.name),
                Text(widget.questionnaire.questions.length.toString()),
                ..._buildQuestionWidgets(),
              ],
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     //TODO: Make this expand and show all of the questions
          //   },
          //   icon: const Icon(
          //     Icons.arrow_forward_ios,
          //   ),
          // ),
        ],
      ),
    );
  }

  List<Widget> _buildQuestionWidgets() {
    List<Widget> widgets = [];

    for (Question question in widget.questionnaire.questions) {
      widgets.add(
        Container(
          margin: const EdgeInsets.only(
            top: 16,
            // bottom: 8,
          ),
          child: QuestionWidget(
            question: question,
            isResponse: widget.isResponse,
          ),
        ),
      );
    }

    return widgets;
  }
}
