import 'package:bookends/models/basic.dart';
import 'package:bookends/pages/home/bookend_detail_page.dart';
import 'package:bookends/pages/home/response_detail_page.dart';
import 'package:bookends/services/bookend_response_service/i_bookend_response_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BookendButtonWidget extends StatelessWidget {
  const BookendButtonWidget({
    super.key,
    required this.bookend,
  });

  final Bookend bookend;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookendDetailPage(bookend: bookend)),
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
                  bookend.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Questionnaire Count: ${bookend.questionnaires.length}, Total Question Count: ${bookend.questionnaires.fold(0, (previousValue, element) => previousValue + element.questions.length)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        MaterialButton(
          onPressed: () {
            final IBookendResponseService bookendResponseService =
                GetIt.I<IBookendResponseService>();
            bookendResponseService.createNewResponse(
              bookend: bookend,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ResponseDetailPage(),
              ),
            );
          },
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          child: Text(
            'New Response',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
