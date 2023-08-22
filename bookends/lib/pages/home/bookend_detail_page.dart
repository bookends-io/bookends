import 'package:bookends/models/basic.dart';
import 'package:bookends/widgets/questionnaire_widget.dart';
import 'package:flutter/material.dart';

class BookendDetailPage extends StatefulWidget {
  const BookendDetailPage({
    super.key,
    required this.bookend,
  });

  final Bookend bookend;

  @override
  State<BookendDetailPage> createState() => _BookendDetailPageState();
}

class _BookendDetailPageState extends State<BookendDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(widget.bookend.name),
      ),
      body: ListView.builder(
        itemCount: widget.bookend.questionnaires.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: QuestionnaireWidget(
              questionnaire: widget.bookend.questionnaires[index],
            ),
          );
        },
      ),
    );
  }
}
