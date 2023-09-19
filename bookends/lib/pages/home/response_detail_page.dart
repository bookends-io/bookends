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

  final Map<int, bool> _expandedAnswerGroups = {};

  @override
  Widget build(BuildContext context) {
    final Bookend? bookend = _bookendService
        .getBookend(_bookendResponseService.currentResponse!.bookendId);

    final List<ExpansionPanel> answerGroupPanels = _bookendResponseService
        .currentResponse!.answerGroups
        .map<ExpansionPanel>((answerGroup) {
      int index = _bookendResponseService.currentResponse!.answerGroups
          .indexOf(answerGroup);
      return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text('Answer Group ${index + 1}'),
          );
        },
        body: AnswerGroupWidget(answerGroupId: answerGroup.id),
        isExpanded: _expandedAnswerGroups[index] ?? false,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(bookend?.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    if (isExpanded) {
                      _expandedAnswerGroups[index] = false;
                    } else {
                      _expandedAnswerGroups[index] = true;
                    }
                  });
                },
                children: answerGroupPanels,
              ),
              MaterialButton(
                onPressed: () async {
                  _bookendResponseService.saveResponse();
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
