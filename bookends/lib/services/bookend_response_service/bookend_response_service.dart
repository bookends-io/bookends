import 'package:bookends/models/basic.dart';
import 'package:bookends/services/bookend_response_service/i_bookend_response_service.dart';
import 'package:bookends/services/i_backend.dart';
import 'package:bookends/services/local_file_service/i_local_file_service.dart';
import 'package:bookends/utils/id_util.dart';
import 'package:get_it/get_it.dart';

class BookendResponseService extends IBookendResponseService {
  final Map<String, AnswerGroup> _answerGroups = {};
  final Map<String, Answer> _answers = {};

  Response? _currentResponse;
  @override
  Response? get currentResponse => _currentResponse;

  Questionnaire? _currentQuestionnaire;
  @override
  Questionnaire? get currentQuestionnaire => _currentQuestionnaire;

  int? _currentAnswerGroupIndex;
  @override
  int? get currentAnswerGroupIndex => _currentAnswerGroupIndex;

  DateTime? _lastSave;
  @override
  DateTime? get lastSave => _lastSave;

  @override
  Response createNewResponse({
    required Bookend bookend,
  }) {
    final String responseId = IdUtil.generateId();

    final List<Answer> answers = [];

    final Questionnaire questionnaire = bookend.questionnaires[0];

    // Popluate the answers list using the questionnaire
    for (var question in questionnaire.questions) {
      answers.add(
        Answer(
          id: IdUtil.generateId(),
          answerGroupId: questionnaire.id,
          questionnaireId: questionnaire.id,
          questionId: question.id,
          answer: null,
        ),
      );
    }

    _currentResponse = Response(
      id: responseId,
      bookendId: bookend.id,
      questionnaireIds: [questionnaire.id],
      userId: 'someUserId',
      answerGroups: [
        AnswerGroup(
          id: IdUtil.generateId(),
          responseId: responseId,
          questionnaireId: questionnaire.id,
          answers: answers,
        ),
      ],
    );
    _unpackCurrentResponse();
    _currentQuestionnaire = questionnaire;
    _lastSave = DateTime.now();

    notifyListeners();

    return _currentResponse!;
  }

  @override
  void continueResponse({
    required Response response,
    required Questionnaire questionnaire,
  }) {
    _currentResponse = response;
    _currentQuestionnaire = questionnaire;

    final String answerGroupId = IdUtil.generateId();

    final List<Answer> answers = [];
    for (final Question q in questionnaire.questions) {
      answers.add(
        Answer(
          id: IdUtil.generateId(),
          answerGroupId: questionnaire.id,
          questionnaireId: questionnaire.id,
          questionId: q.id,
          answer: null,
        ),
      );
    }

    final AnswerGroup newAnswerGroup = AnswerGroup(
      id: answerGroupId,
      responseId: response.id,
      questionnaireId: questionnaire.id,
      answers: answers,
    );

    _currentResponse!.answerGroups.add(newAnswerGroup);
    _unpackCurrentResponse();

    _currentAnswerGroupIndex = _currentResponse!.answerGroups.length - 1;

    notifyListeners();
  }

  void _unpackCurrentResponse() {
    _answerGroups.clear();
    _answers.clear();
    for (final AnswerGroup ag in _currentResponse!.answerGroups) {
      _answerGroups[ag.id] = ag;
      for (final Answer a in ag.answers) {
        _answers[a.id] = a;
      }
    }
  }

  @override
  void updateQuestion({
    required String answerGroupId,
    required String answerId,
    required dynamic answer,
  }) {
    if (_currentResponse == null) {
      return;
    }

    // Drill down and get the question that was answered
    int answerGroupIndex = 0;
    int answerIndex = 0;
    Answer? answerObj;
    for (AnswerGroup ag in _currentResponse!.answerGroups) {
      if (ag.id == answerGroupId) {
        for (Answer a in ag.answers) {
          if (a.id == answerId) {
            answerObj = a;
            break;
          }
          answerIndex++;
        }
      }
      answerGroupIndex++;
    }

    // Stop if we weren't able to find an answer object
    if (answerObj == null) {
      return;
    }

    // Update the answer object
    answerObj = answerObj.copyWith(answer: answer);

    // Update the answer group
    _currentResponse!.answerGroups[answerGroupIndex].answers[answerIndex] =
        answerObj;

    // Save the new data
    saveResponse();

    // Notify listeners
    notifyListeners();
  }

  @override
  Future<void> saveResponse() async {
    final ILocalFileService localFileService = GetIt.I<ILocalFileService>();
    final IBackend backend = GetIt.I<IBackend>();

    await localFileService.write(
        _currentResponse!.id, _currentResponse!.toJson());
    _lastSave = DateTime.now();
    var pushSuccess = await backend.pushResponse(_currentResponse!);

    if (!pushSuccess) {
      print('Failed to push response to backend');
    }
  }

  @override
  AnswerGroup? getAnswerGroup({
    required String answerGroupId,
  }) {
    return _answerGroups[answerGroupId];
  }

  @override
  Answer? getAnswer({
    required String answerId,
  }) {
    return _answers[answerId];
  }
}
