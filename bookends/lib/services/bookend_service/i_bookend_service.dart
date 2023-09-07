import 'package:bookends/models/basic.dart';

abstract class IBookendService {
  /// Retreives all of the bookends from local and cloud storage
  Future<void> init();

  /// Retreives the bookend with the provided ID
  /// Returns null if the bookend does not exist
  Bookend? getBookend(String id);

  /// Retreives the questionnaire with the provided ID
  /// Returns null if the questionnaire does not exist
  Questionnaire? getQuestionnaire(String id);

  /// Retreives the question with the provided ID
  /// Returns null if the question does not exist
  Question? getQuestion(String id);
}
