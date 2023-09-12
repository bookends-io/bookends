import 'dart:async';

import 'package:bookends/models/basic.dart';
import 'package:bookends/services/bookend_response_service/i_bookend_response_service.dart';
import 'package:bookends/services/bookend_service/i_bookend_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

enum AnswerSaveState {
  unsaved,
  saving,
  saved,
}

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

  AnswerSaveState _saveState = AnswerSaveState.saved;
  Timer? _timer;

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
        Stack(
          children: [
            TextField(
              controller: _textEditingController,
              onChanged: _onChanged,
              onEditingComplete: () =>
                  _updateAnswer(_textEditingController.text),
              onSubmitted: (value) => _updateAnswer(value),
              maxLines: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your answer here',
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Text(
                _getSaveStateInfo(),
              ),
            )
          ],
        )
      ],
    );
  }

  String _getSaveStateInfo() {
    switch (_saveState) {
      case AnswerSaveState.unsaved:
        return 'Unsaved';
      case AnswerSaveState.saving:
        return 'Saving...';
      case AnswerSaveState.saved:
        return 'Saved';
    }
  }

  void _onChanged(String value) {
    setState(() {
      _saveState = AnswerSaveState.unsaved;
    });

    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(
      const Duration(milliseconds: 2000),
      () {
        _updateAnswer(value);
      },
    );
  }

  Future<void> _updateAnswer(String value) async {
    if (_timer != null) {
      _timer!.cancel();
    }

    // Update the save state
    setState(() {
      _saveState = AnswerSaveState.saving;
    });

    await _bookendResponseService.updateAnswer(
      answerId: widget.answerId,
      value: value,
    );

    setState(() {
      _saveState = AnswerSaveState.saved;
    });
  }
}
