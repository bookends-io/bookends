import 'package:bookends/models/basic.dart';
import 'package:bookends/utils/logger_util.dart';

class ResponseUtils {
  /// Returns true if the response has an answer group for each
  /// questionnaire in the respective Bookend
  static bool responseIsComplete({
    required Response response,
  }) {
    LoggerUtil.logger.d('responseIsComplete, response: $response');
    final Set<String> questionnaireIds = Set.from(response.questionnaireIds);
    final Set<String> answerGroupQuestionnaireIds = Set.from(
      response.answerGroups.map((ag) => ag.questionnaireId),
    );
    LoggerUtil.logger.i(
      'responseIsComplete, questionnaireIds: $questionnaireIds, answerGroupQuestionnaireIds: $answerGroupQuestionnaireIds',
    );

    // Ensure that they are both equal
    if (questionnaireIds.difference(answerGroupQuestionnaireIds).isNotEmpty) {
      return false;
    }

    return true;
  }

  /// Finds the next questionnaire that isn't filled out and returns its ID.
  /// If the Response is complete, this will return null.
  static String? getNextQuestionnaireId({required Response response}) {
    LoggerUtil.logger.d('getNextQuestionnaireId, response: $response');
    if (responseIsComplete(response: response)) {
      return null;
    }

    // Loop through the questionnaire IDs and return the first one that isn't
    // in the answer groups
    for (final String questionnaireId in response.questionnaireIds) {
      if (!response.answerGroups
          .any((ag) => ag.questionnaireId == questionnaireId)) {
        LoggerUtil.logger.t(
          'getNextQuestionnaireId, returning: $questionnaireId',
        );
        return questionnaireId;
      }
    }

    return null;
  }
}
