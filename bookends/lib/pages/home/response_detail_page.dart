import 'package:bookends/models/basic.dart';
import 'package:bookends/services/bookend_response_service/i_bookend_response_service.dart';
import 'package:bookends/services/bookend_service/i_bookend_service.dart';
import 'package:bookends/widgets/answer_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ResponseDetailPage extends StatefulWidget {
  const ResponseDetailPage({
    super.key,
  });

  @override
  State<ResponseDetailPage> createState() => _ResponseDetailPageState();
}

class _ResponseDetailPageState extends State<ResponseDetailPage> {
  final IBookendResponseService _bookendResponseService =
      GetIt.I<IBookendResponseService>();
  final IBookendService _bookendService = GetIt.I<IBookendService>();

  @override
  Widget build(BuildContext context) {
    final Bookend? bookend = _bookendService
        .getBookend(_bookendResponseService.currentResponse!.bookendId);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
            '${bookend?.name} - ${_bookendResponseService.currentQuestionnaire!.name}'),
      ),
      body: ListView.builder(
        itemCount: _bookendResponseService.currentResponse!.answerGroups.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: AnswerGroupWidget(
              answerGroupId: _bookendResponseService
                  .currentResponse!.answerGroups[index].id,
            ),
          );
        },
      ),
    );
  }
}
