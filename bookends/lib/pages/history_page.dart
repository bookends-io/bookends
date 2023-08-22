import 'package:bookends/constants/string_constants.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(StringConstants.historyPageTitle),
    );
  }
}
