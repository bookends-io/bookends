import 'package:bookends/models/basic.dart';
import 'package:bookends/pages/home/bookend_detail_page.dart';
import 'package:flutter/material.dart';

class BookendWidget extends StatelessWidget {
  const BookendWidget({
    super.key,
    required this.bookend,
  });

  final Bookend bookend;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
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
    );
  }
}
