import 'package:bookends/models/basic.dart';
import 'package:bookends/services/bookend_response_service/i_bookend_response_service.dart';
import 'package:bookends/services/bookend_service/i_bookend_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AnswerWidget extends StatefulWidget {
  const AnswerWidget({
    super.key,
    required this.answerId,
  });

  final String answerId;

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  final IBookendResponseService _bookendResponseService =
      GetIt.I<IBookendResponseService>();
  final IBookendService _bookendService = GetIt.I<IBookendService>();

  @override
  Widget build(BuildContext context) {
    final Answer? answer = _bookendResponseService.getAnswer(
      answerId: widget.answerId,
    );
    if (answer == null) {
      return const Text('Error: No Answer Found');
    }

    final Question? question = _bookendService.getQuestion(
      answer.questionId,
    );
    if (question == null) {
      return const Text('Error: No Question Found');
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                question.text,
                maxLines: 10,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _textEditingController,
          maxLines: 10,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter your answer here',
          ),
        ),
      ],
    );
  }
}
