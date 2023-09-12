import 'package:bookends/models/basic.dart';
import 'package:flutter/material.dart';

abstract class IBookendResponseService with ChangeNotifier {
  /// The response the user is currently working on
  Response? get currentResponse;

  /// The questionnaire the user is currently responding to
  Questionnaire? get currentQuestionnaire;

  /// The index of the answer group the user is responding to.
  int? get currentAnswerGroupIndex;

  /// The time of the last save
  DateTime? get lastSave;

  /// Retreives all of the responses from local and cloud storage
  Future<void> init();

  /// Creates a new response for the provided questionnaire
  Response createNewResponse({
    required Bookend bookend,
  });

  /// Continues the response with the provided questionnaire
  void continueResponse({
    required Response response,
    required Questionnaire questionnaire,
  });

  /// Updates the response of the provided question ID with the given answer
  Future<void> updateAnswer({
    required String answerId,
    required dynamic value,
  });

  /// Saves the response locally, and if possible submits the response to the backend
  Future<void> saveResponse();

  /// Gets the saved responses from the backend
  Future<List<Response>> getResponses({
    bool onlyIncomplete = false,
  });

  /// Gets the answer group with the provided ID
  /// Uses the current response if no response ID is provided
  /// Returns null if the answer group does not exist in the current response
  AnswerGroup? getAnswerGroup({
    required String answerGroupId,
  });

  /// Gets the answer with the provided ID
  /// Uses the current response
  /// Returns null if the answer does not exist in the current response
  Answer? getAnswer({
    required String answerId,
  });
}
