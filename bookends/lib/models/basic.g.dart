// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bookend _$$_BookendFromJson(Map<String, dynamic> json) => _$_Bookend(
      id: json['id'] as String,
      name: json['name'] as String,
      public: json['public'] as bool,
      questionnaires: (json['questionnaires'] as List<dynamic>)
          .map((e) => Questionnaire.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BookendToJson(_$_Bookend instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'public': instance.public,
      'questionnaires': instance.questionnaires.map((e) => e.toJson()).toList(),
    };

_$_Questionnaire _$$_QuestionnaireFromJson(Map<String, dynamic> json) =>
    _$_Questionnaire(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionnaireToJson(_$_Questionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      id: json['id'] as String,
      text: json['text'] as String,
      description: json['description'] as String?,
      type: json['type'] as String,
      reliesOn: (json['reliesOn'] as List<dynamic>?)
          ?.map((e) => QuestionId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'description': instance.description,
      'type': instance.type,
      'reliesOn': instance.reliesOn?.map((e) => e.toJson()).toList(),
    };

_$_Response _$$_ResponseFromJson(Map<String, dynamic> json) => _$_Response(
      id: json['id'] as String,
      bookendId: json['bookendId'] as String,
      questionnaireIds: (json['questionnaireIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userId: json['userId'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResponseToJson(_$_Response instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookendId': instance.bookendId,
      'questionnaireIds': instance.questionnaireIds,
      'userId': instance.userId,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };

_$_AnswerGroup _$$_AnswerGroupFromJson(Map<String, dynamic> json) =>
    _$_AnswerGroup(
      id: json['id'] as String,
      responseId: json['responseId'] as String,
      questionnaireId: json['questionnaireId'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AnswerGroupToJson(_$_AnswerGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'responseId': instance.responseId,
      'questionnaireId': instance.questionnaireId,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
    };

_$_Answer _$$_AnswerFromJson(Map<String, dynamic> json) => _$_Answer(
      id: json['id'] as String,
      answerGroupId: json['answerGroupId'] as String,
      questionnaireId: json['questionnaireId'] as String,
      questionId: json['questionId'] as String,
      answer: json['answer'],
    );

Map<String, dynamic> _$$_AnswerToJson(_$_Answer instance) => <String, dynamic>{
      'id': instance.id,
      'answerGroupId': instance.answerGroupId,
      'questionnaireId': instance.questionnaireId,
      'questionId': instance.questionId,
      'answer': instance.answer,
    };

_$_QuestionId _$$_QuestionIdFromJson(Map<String, dynamic> json) =>
    _$_QuestionId(
      questionnaireId: json['questionnaireId'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$_QuestionIdToJson(_$_QuestionId instance) =>
    <String, dynamic>{
      'questionnaireId': instance.questionnaireId,
      'id': instance.id,
    };
