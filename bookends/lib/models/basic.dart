import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic.freezed.dart';
part 'basic.g.dart';

@freezed
class Bookend with _$Bookend {
  @JsonSerializable(explicitToJson: true)
  factory Bookend({
    required String id,
    required String name,
    required bool public,
    required List<Questionnaire> questionnaires,
  }) = _Bookend;

  factory Bookend.fromJson(Map<String, dynamic> json) =>
      _$BookendFromJson(json);
}

@freezed
class Questionnaire with _$Questionnaire {
  @JsonSerializable(explicitToJson: true)
  factory Questionnaire({
    required String id,
    required String name,
    required String? description,
    required List<Question> questions,
  }) = _Questionnaire;

  factory Questionnaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireFromJson(json);
}

@freezed
class Question with _$Question {
  @JsonSerializable(explicitToJson: true)
  factory Question({
    required String id,
    required String text,
    required String? description,
    required String type,
    required List<Question> reliesOn,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
class Response with _$Response {
  @JsonSerializable(explicitToJson: true)
  factory Response({
    required String id,
    required String bookendId,
    required List<String> questionnaireIds,
    required String userId,
    required List<AnswerGroup> answers,
  }) = _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

@freezed
class AnswerGroup with _$AnswerGroup {
  @JsonSerializable(explicitToJson: true)
  factory AnswerGroup({
    required String id,
    required String responseId,
    required String questionnaireId,
    required List<Answer> answers,
  }) = _AnswerGroup;

  factory AnswerGroup.fromJson(Map<String, dynamic> json) =>
      _$AnswerGroupFromJson(json);
}

@freezed
class Answer with _$Answer {
  @JsonSerializable(explicitToJson: true)
  factory Answer({
    required String id,
    required String answerGroupId,
    required String questionnaireId,
    required String questionId,
    required dynamic answer,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
