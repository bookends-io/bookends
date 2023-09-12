import 'package:bookends/models/basic.dart';
import 'package:bookends/pages/home/response_detail_page.dart';
import 'package:bookends/services/bookend_response_service/i_bookend_response_service.dart';
import 'package:bookends/services/bookend_response_service/response_utils.dart';
import 'package:bookends/services/bookend_service/i_bookend_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ResponseButtonWidget extends StatelessWidget {
  const ResponseButtonWidget({
    super.key,
    required this.response,
  });

  final Response response;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {
            final IBookendResponseService bookendResponseService =
                GetIt.I<IBookendResponseService>();
            final IBookendService bookendService = GetIt.I<IBookendService>();
            final Questionnaire? questionnaire =
                bookendService.getQuestionnaire(
              ResponseUtils.getNextQuestionnaireId(
                    response: response,
                  ) ??
                  '',
            );
            print('Questionnaire: $questionnaire');

            if (questionnaire == null) {
              return;
            }

            bookendResponseService.continueResponse(
              response: response,
              questionnaire: questionnaire,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ResponseDetailPage()),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  response.id,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Is Complete: ${ResponseUtils.responseIsComplete(response: response)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        // const SizedBox(
        //   width: 8,
        // ),
        // MaterialButton(
        //   onPressed: () {
        //     final IBookendResponseService bookendResponseService =
        //         GetIt.I<IBookendResponseService>();
        //     bookendResponseService.createNewResponse(
        //       bookend: bookend,
        //     );
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const ResponseDetailPage(),
        //       ),
        //     );
        //   },
        //   color: Theme.of(context).colorScheme.primaryContainer,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(
        //       5,
        //     ),
        //   ),
        //   child: Text(
        //     'New Response',
        //     style: Theme.of(context).textTheme.bodyLarge,
        //   ),
        // ),
      ],
    );
  }
}
