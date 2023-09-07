import 'package:bookends/models/basic.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
    required this.question,
    this.isResponse = false,
  });

  final Question question;
  final bool isResponse;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.question.text,
                  maxLines: 10,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          widget.isResponse
              ? TextField(
                  controller: _textEditingController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your answer here',
                  ),
                )
              : Text(
                  widget.question.type.toString(),
                  maxLines: 10,
                ),
        ],
      ),
    );
  }
}
