import 'package:bookends/models/basic.dart';

class ResponseUtils {
  /// Returns true if the response has an answer group for each
  /// questionnaire in the respective Bookend
  static bool responseIsComplete({
    required Response response,
  }) {
    final Set<String> questionnaireIds = Set.from(response.questionnaireIds);
    print('responseIsComplete, questionnaireIds: $questionnaireIds');
    final Set<String> answerGroupQuestionnaireIds = Set.from(
      response.answerGroups.map((ag) => ag.questionnaireId),
    );
    print(
        'responseIsComplete, answerGroupQuestionnaireIds: $answerGroupQuestionnaireIds');

    // Ensure that they are both equal
    if (questionnaireIds.difference(answerGroupQuestionnaireIds).isNotEmpty) {
      return false;
    }

    return true;
  }

  /// Finds the next questionnaire that isn't filled out and returns its ID.
  /// If the Response is complete, this will return null.
  static String? getNextQuestionnaireId({required Response response}) {
    print('got here');
    if (responseIsComplete(response: response)) {
      return null;
    }

    // Loop through the questionnaire IDs and return the first one that isn't
    // in the answer groups
    for (final String questionnaireId in response.questionnaireIds) {
      if (!response.answerGroups
          .any((ag) => ag.questionnaireId == questionnaireId)) {
        print('Questionnaire ID: $questionnaireId');
        return questionnaireId;
      }
    }
    print('swag');
    return null;
  }
}
