import 'package:bookends/models/basic.dart';
import 'package:bookends/services/bookend_response_service/i_bookend_response_service.dart';
import 'package:bookends/services/bookend_response_service/response_utils.dart';
import 'package:bookends/services/i_backend.dart';
import 'package:bookends/services/local_file_service/i_local_file_service.dart';
import 'package:bookends/utils/id_util.dart';
import 'package:get_it/get_it.dart';

class BookendResponseService extends IBookendResponseService {
  static const String localStorageSubdirectory = 'responses';

  List<Response> _responses = [];

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
  Future<void> init() async {
    final ILocalFileService localFileService = GetIt.I<ILocalFileService>();
    // TODO: Pull from backend as well
    // final IBackend backend = GetIt.I<IBackend>();

    // Get all of the responses
    final List<Map<String, dynamic>> responseJsons =
        await localFileService.readAll(
      directory: localFileService.getSubdirectory(
        localStorageSubdirectory,
      ),
    );

    // Convert the responses to objects
    final List<Response> responses = [];
    for (final Map<String, dynamic> responseJson in responseJsons) {
      responses.add(Response.fromJson(responseJson));
    }

    _responses = responses;
  }

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

    _responses.add(_currentResponse!);

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
  Future<void> updateAnswer({
    required String answerId,
    required dynamic value,
  }) async {
    if (_currentResponse == null) {
      return;
    }

    // Drill down and get the question that was answered
    Answer? answerObj = getAnswer(answerId: answerId);

    // Stop if we weren't able to find an answer object
    if (answerObj == null) {
      return;
    }

    // Update the answer object
    answerObj = answerObj.copyWith(answer: value);

    // Update the answer group
    // _currentResponse!.answerGroups[answerGroupIndex].answers[answerIndex] =
    //     answerObj;

    // Save the new data
    await saveResponse();

    // Notify listeners
    notifyListeners();
  }

  @override
  Future<void> saveResponse() async {
    final ILocalFileService localFileService = GetIt.I<ILocalFileService>();
    final IBackend backend = GetIt.I<IBackend>();

    await localFileService.write(
      _currentResponse!.id,
      _currentResponse!.toJson(),
      directory: localFileService.getSubdirectory(
        localStorageSubdirectory,
      ),
    );
    _lastSave = DateTime.now();
    var pushSuccess = await backend.pushResponse(_currentResponse!);

    if (!pushSuccess) {
      print('Failed to push response to backend');
    }
  }

  @override
  Future<List<Response>> getResponses({
    bool onlyIncomplete = false,
  }) async {
    if (onlyIncomplete) {
      return _responses
          .where((r) => !ResponseUtils.responseIsComplete(response: r))
          .toList();
    } else {
      return _responses;
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
