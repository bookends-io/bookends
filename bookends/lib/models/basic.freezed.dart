// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bookend _$BookendFromJson(Map<String, dynamic> json) {
  return _Bookend.fromJson(json);
}

/// @nodoc
mixin _$Bookend {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get public => throw _privateConstructorUsedError;
  List<Questionnaire> get questionnaires => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookendCopyWith<Bookend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookendCopyWith<$Res> {
  factory $BookendCopyWith(Bookend value, $Res Function(Bookend) then) =
      _$BookendCopyWithImpl<$Res, Bookend>;
  @useResult
  $Res call(
      {String id,
      String name,
      bool public,
      List<Questionnaire> questionnaires});
}

/// @nodoc
class _$BookendCopyWithImpl<$Res, $Val extends Bookend>
    implements $BookendCopyWith<$Res> {
  _$BookendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? public = null,
    Object? questionnaires = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      questionnaires: null == questionnaires
          ? _value.questionnaires
          : questionnaires // ignore: cast_nullable_to_non_nullable
              as List<Questionnaire>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookendCopyWith<$Res> implements $BookendCopyWith<$Res> {
  factory _$$_BookendCopyWith(
          _$_Bookend value, $Res Function(_$_Bookend) then) =
      __$$_BookendCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      bool public,
      List<Questionnaire> questionnaires});
}

/// @nodoc
class __$$_BookendCopyWithImpl<$Res>
    extends _$BookendCopyWithImpl<$Res, _$_Bookend>
    implements _$$_BookendCopyWith<$Res> {
  __$$_BookendCopyWithImpl(_$_Bookend _value, $Res Function(_$_Bookend) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? public = null,
    Object? questionnaires = null,
  }) {
    return _then(_$_Bookend(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      questionnaires: null == questionnaires
          ? _value._questionnaires
          : questionnaires // ignore: cast_nullable_to_non_nullable
              as List<Questionnaire>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Bookend implements _Bookend {
  _$_Bookend(
      {required this.id,
      required this.name,
      required this.public,
      required final List<Questionnaire> questionnaires})
      : _questionnaires = questionnaires;

  factory _$_Bookend.fromJson(Map<String, dynamic> json) =>
      _$$_BookendFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool public;
  final List<Questionnaire> _questionnaires;
  @override
  List<Questionnaire> get questionnaires {
    if (_questionnaires is EqualUnmodifiableListView) return _questionnaires;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionnaires);
  }

  @override
  String toString() {
    return 'Bookend(id: $id, name: $name, public: $public, questionnaires: $questionnaires)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bookend &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.public, public) || other.public == public) &&
            const DeepCollectionEquality()
                .equals(other._questionnaires, _questionnaires));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, public,
      const DeepCollectionEquality().hash(_questionnaires));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookendCopyWith<_$_Bookend> get copyWith =>
      __$$_BookendCopyWithImpl<_$_Bookend>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookendToJson(
      this,
    );
  }
}

abstract class _Bookend implements Bookend {
  factory _Bookend(
      {required final String id,
      required final String name,
      required final bool public,
      required final List<Questionnaire> questionnaires}) = _$_Bookend;

  factory _Bookend.fromJson(Map<String, dynamic> json) = _$_Bookend.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get public;
  @override
  List<Questionnaire> get questionnaires;
  @override
  @JsonKey(ignore: true)
  _$$_BookendCopyWith<_$_Bookend> get copyWith =>
      throw _privateConstructorUsedError;
}

Questionnaire _$QuestionnaireFromJson(Map<String, dynamic> json) {
  return _Questionnaire.fromJson(json);
}

/// @nodoc
mixin _$Questionnaire {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Question> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionnaireCopyWith<Questionnaire> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionnaireCopyWith<$Res> {
  factory $QuestionnaireCopyWith(
          Questionnaire value, $Res Function(Questionnaire) then) =
      _$QuestionnaireCopyWithImpl<$Res, Questionnaire>;
  @useResult
  $Res call(
      {String id, String name, String? description, List<Question> questions});
}

/// @nodoc
class _$QuestionnaireCopyWithImpl<$Res, $Val extends Questionnaire>
    implements $QuestionnaireCopyWith<$Res> {
  _$QuestionnaireCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionnaireCopyWith<$Res>
    implements $QuestionnaireCopyWith<$Res> {
  factory _$$_QuestionnaireCopyWith(
          _$_Questionnaire value, $Res Function(_$_Questionnaire) then) =
      __$$_QuestionnaireCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String? description, List<Question> questions});
}

/// @nodoc
class __$$_QuestionnaireCopyWithImpl<$Res>
    extends _$QuestionnaireCopyWithImpl<$Res, _$_Questionnaire>
    implements _$$_QuestionnaireCopyWith<$Res> {
  __$$_QuestionnaireCopyWithImpl(
      _$_Questionnaire _value, $Res Function(_$_Questionnaire) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? questions = null,
  }) {
    return _then(_$_Questionnaire(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Questionnaire implements _Questionnaire {
  _$_Questionnaire(
      {required this.id,
      required this.name,
      required this.description,
      required final List<Question> questions})
      : _questions = questions;

  factory _$_Questionnaire.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionnaireFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  final List<Question> _questions;
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'Questionnaire(id: $id, name: $name, description: $description, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Questionnaire &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionnaireCopyWith<_$_Questionnaire> get copyWith =>
      __$$_QuestionnaireCopyWithImpl<_$_Questionnaire>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionnaireToJson(
      this,
    );
  }
}

abstract class _Questionnaire implements Questionnaire {
  factory _Questionnaire(
      {required final String id,
      required final String name,
      required final String? description,
      required final List<Question> questions}) = _$_Questionnaire;

  factory _Questionnaire.fromJson(Map<String, dynamic> json) =
      _$_Questionnaire.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  List<Question> get questions;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionnaireCopyWith<_$_Questionnaire> get copyWith =>
      throw _privateConstructorUsedError;
}

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<Question> get reliesOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {String id,
      String text,
      String? description,
      String type,
      List<Question> reliesOn});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? description = freezed,
    Object? type = null,
    Object? reliesOn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reliesOn: null == reliesOn
          ? _value.reliesOn
          : reliesOn // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      String? description,
      String type,
      List<Question> reliesOn});
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? description = freezed,
    Object? type = null,
    Object? reliesOn = null,
  }) {
    return _then(_$_Question(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      reliesOn: null == reliesOn
          ? _value._reliesOn
          : reliesOn // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Question implements _Question {
  _$_Question(
      {required this.id,
      required this.text,
      required this.description,
      required this.type,
      required final List<Question> reliesOn})
      : _reliesOn = reliesOn;

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String? description;
  @override
  final String type;
  final List<Question> _reliesOn;
  @override
  List<Question> get reliesOn {
    if (_reliesOn is EqualUnmodifiableListView) return _reliesOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reliesOn);
  }

  @override
  String toString() {
    return 'Question(id: $id, text: $text, description: $description, type: $type, reliesOn: $reliesOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._reliesOn, _reliesOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, description, type,
      const DeepCollectionEquality().hash(_reliesOn));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  factory _Question(
      {required final String id,
      required final String text,
      required final String? description,
      required final String type,
      required final List<Question> reliesOn}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  String? get description;
  @override
  String get type;
  @override
  List<Question> get reliesOn;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return _Response.fromJson(json);
}

/// @nodoc
mixin _$Response {
  String get id => throw _privateConstructorUsedError;
  String get bookendId => throw _privateConstructorUsedError;
  List<String> get questionnaireIds => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<AnswerGroup> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseCopyWith<Response> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCopyWith<$Res> {
  factory $ResponseCopyWith(Response value, $Res Function(Response) then) =
      _$ResponseCopyWithImpl<$Res, Response>;
  @useResult
  $Res call(
      {String id,
      String bookendId,
      List<String> questionnaireIds,
      String userId,
      List<AnswerGroup> answers});
}

/// @nodoc
class _$ResponseCopyWithImpl<$Res, $Val extends Response>
    implements $ResponseCopyWith<$Res> {
  _$ResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookendId = null,
    Object? questionnaireIds = null,
    Object? userId = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookendId: null == bookendId
          ? _value.bookendId
          : bookendId // ignore: cast_nullable_to_non_nullable
              as String,
      questionnaireIds: null == questionnaireIds
          ? _value.questionnaireIds
          : questionnaireIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerGroup>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseCopyWith<$Res> implements $ResponseCopyWith<$Res> {
  factory _$$_ResponseCopyWith(
          _$_Response value, $Res Function(_$_Response) then) =
      __$$_ResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String bookendId,
      List<String> questionnaireIds,
      String userId,
      List<AnswerGroup> answers});
}

/// @nodoc
class __$$_ResponseCopyWithImpl<$Res>
    extends _$ResponseCopyWithImpl<$Res, _$_Response>
    implements _$$_ResponseCopyWith<$Res> {
  __$$_ResponseCopyWithImpl(
      _$_Response _value, $Res Function(_$_Response) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookendId = null,
    Object? questionnaireIds = null,
    Object? userId = null,
    Object? answers = null,
  }) {
    return _then(_$_Response(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookendId: null == bookendId
          ? _value.bookendId
          : bookendId // ignore: cast_nullable_to_non_nullable
              as String,
      questionnaireIds: null == questionnaireIds
          ? _value._questionnaireIds
          : questionnaireIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerGroup>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Response implements _Response {
  _$_Response(
      {required this.id,
      required this.bookendId,
      required final List<String> questionnaireIds,
      required this.userId,
      required final List<AnswerGroup> answers})
      : _questionnaireIds = questionnaireIds,
        _answers = answers;

  factory _$_Response.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseFromJson(json);

  @override
  final String id;
  @override
  final String bookendId;
  final List<String> _questionnaireIds;
  @override
  List<String> get questionnaireIds {
    if (_questionnaireIds is EqualUnmodifiableListView)
      return _questionnaireIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionnaireIds);
  }

  @override
  final String userId;
  final List<AnswerGroup> _answers;
  @override
  List<AnswerGroup> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'Response(id: $id, bookendId: $bookendId, questionnaireIds: $questionnaireIds, userId: $userId, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Response &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookendId, bookendId) ||
                other.bookendId == bookendId) &&
            const DeepCollectionEquality()
                .equals(other._questionnaireIds, _questionnaireIds) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bookendId,
      const DeepCollectionEquality().hash(_questionnaireIds),
      userId,
      const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseCopyWith<_$_Response> get copyWith =>
      __$$_ResponseCopyWithImpl<_$_Response>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseToJson(
      this,
    );
  }
}

abstract class _Response implements Response {
  factory _Response(
      {required final String id,
      required final String bookendId,
      required final List<String> questionnaireIds,
      required final String userId,
      required final List<AnswerGroup> answers}) = _$_Response;

  factory _Response.fromJson(Map<String, dynamic> json) = _$_Response.fromJson;

  @override
  String get id;
  @override
  String get bookendId;
  @override
  List<String> get questionnaireIds;
  @override
  String get userId;
  @override
  List<AnswerGroup> get answers;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseCopyWith<_$_Response> get copyWith =>
      throw _privateConstructorUsedError;
}

AnswerGroup _$AnswerGroupFromJson(Map<String, dynamic> json) {
  return _AnswerGroup.fromJson(json);
}

/// @nodoc
mixin _$AnswerGroup {
  String get id => throw _privateConstructorUsedError;
  String get responseId => throw _privateConstructorUsedError;
  String get questionnaireId => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerGroupCopyWith<AnswerGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerGroupCopyWith<$Res> {
  factory $AnswerGroupCopyWith(
          AnswerGroup value, $Res Function(AnswerGroup) then) =
      _$AnswerGroupCopyWithImpl<$Res, AnswerGroup>;
  @useResult
  $Res call(
      {String id,
      String responseId,
      String questionnaireId,
      List<Answer> answers});
}

/// @nodoc
class _$AnswerGroupCopyWithImpl<$Res, $Val extends AnswerGroup>
    implements $AnswerGroupCopyWith<$Res> {
  _$AnswerGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? responseId = null,
    Object? questionnaireId = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      responseId: null == responseId
          ? _value.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      questionnaireId: null == questionnaireId
          ? _value.questionnaireId
          : questionnaireId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerGroupCopyWith<$Res>
    implements $AnswerGroupCopyWith<$Res> {
  factory _$$_AnswerGroupCopyWith(
          _$_AnswerGroup value, $Res Function(_$_AnswerGroup) then) =
      __$$_AnswerGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String responseId,
      String questionnaireId,
      List<Answer> answers});
}

/// @nodoc
class __$$_AnswerGroupCopyWithImpl<$Res>
    extends _$AnswerGroupCopyWithImpl<$Res, _$_AnswerGroup>
    implements _$$_AnswerGroupCopyWith<$Res> {
  __$$_AnswerGroupCopyWithImpl(
      _$_AnswerGroup _value, $Res Function(_$_AnswerGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? responseId = null,
    Object? questionnaireId = null,
    Object? answers = null,
  }) {
    return _then(_$_AnswerGroup(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      responseId: null == responseId
          ? _value.responseId
          : responseId // ignore: cast_nullable_to_non_nullable
              as String,
      questionnaireId: null == questionnaireId
          ? _value.questionnaireId
          : questionnaireId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AnswerGroup implements _AnswerGroup {
  _$_AnswerGroup(
      {required this.id,
      required this.responseId,
      required this.questionnaireId,
      required final List<Answer> answers})
      : _answers = answers;

  factory _$_AnswerGroup.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerGroupFromJson(json);

  @override
  final String id;
  @override
  final String responseId;
  @override
  final String questionnaireId;
  final List<Answer> _answers;
  @override
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'AnswerGroup(id: $id, responseId: $responseId, questionnaireId: $questionnaireId, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.responseId, responseId) ||
                other.responseId == responseId) &&
            (identical(other.questionnaireId, questionnaireId) ||
                other.questionnaireId == questionnaireId) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, responseId, questionnaireId,
      const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerGroupCopyWith<_$_AnswerGroup> get copyWith =>
      __$$_AnswerGroupCopyWithImpl<_$_AnswerGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerGroupToJson(
      this,
    );
  }
}

abstract class _AnswerGroup implements AnswerGroup {
  factory _AnswerGroup(
      {required final String id,
      required final String responseId,
      required final String questionnaireId,
      required final List<Answer> answers}) = _$_AnswerGroup;

  factory _AnswerGroup.fromJson(Map<String, dynamic> json) =
      _$_AnswerGroup.fromJson;

  @override
  String get id;
  @override
  String get responseId;
  @override
  String get questionnaireId;
  @override
  List<Answer> get answers;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerGroupCopyWith<_$_AnswerGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  String get id => throw _privateConstructorUsedError;
  String get answerGroupId => throw _privateConstructorUsedError;
  String get questionnaireId => throw _privateConstructorUsedError;
  String get questionId => throw _privateConstructorUsedError;
  dynamic get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call(
      {String id,
      String answerGroupId,
      String questionnaireId,
      String questionId,
      dynamic answer});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answerGroupId = null,
    Object? questionnaireId = null,
    Object? questionId = null,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answerGroupId: null == answerGroupId
          ? _value.answerGroupId
          : answerGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      questionnaireId: null == questionnaireId
          ? _value.questionnaireId
          : questionnaireId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$_AnswerCopyWith(_$_Answer value, $Res Function(_$_Answer) then) =
      __$$_AnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String answerGroupId,
      String questionnaireId,
      String questionId,
      dynamic answer});
}

/// @nodoc
class __$$_AnswerCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$_Answer>
    implements _$$_AnswerCopyWith<$Res> {
  __$$_AnswerCopyWithImpl(_$_Answer _value, $Res Function(_$_Answer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answerGroupId = null,
    Object? questionnaireId = null,
    Object? questionId = null,
    Object? answer = freezed,
  }) {
    return _then(_$_Answer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answerGroupId: null == answerGroupId
          ? _value.answerGroupId
          : answerGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      questionnaireId: null == questionnaireId
          ? _value.questionnaireId
          : questionnaireId // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Answer implements _Answer {
  _$_Answer(
      {required this.id,
      required this.answerGroupId,
      required this.questionnaireId,
      required this.questionId,
      required this.answer});

  factory _$_Answer.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerFromJson(json);

  @override
  final String id;
  @override
  final String answerGroupId;
  @override
  final String questionnaireId;
  @override
  final String questionId;
  @override
  final dynamic answer;

  @override
  String toString() {
    return 'Answer(id: $id, answerGroupId: $answerGroupId, questionnaireId: $questionnaireId, questionId: $questionId, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Answer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answerGroupId, answerGroupId) ||
                other.answerGroupId == answerGroupId) &&
            (identical(other.questionnaireId, questionnaireId) ||
                other.questionnaireId == questionnaireId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, answerGroupId,
      questionnaireId, questionId, const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      __$$_AnswerCopyWithImpl<_$_Answer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  factory _Answer(
      {required final String id,
      required final String answerGroupId,
      required final String questionnaireId,
      required final String questionId,
      required final dynamic answer}) = _$_Answer;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$_Answer.fromJson;

  @override
  String get id;
  @override
  String get answerGroupId;
  @override
  String get questionnaireId;
  @override
  String get questionId;
  @override
  dynamic get answer;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerCopyWith<_$_Answer> get copyWith =>
      throw _privateConstructorUsedError;
}
