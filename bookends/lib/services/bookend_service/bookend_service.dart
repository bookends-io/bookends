import 'package:bookends/constants/constants.dart';
import 'package:bookends/models/basic.dart';
import 'package:bookends/services/bookend_service/i_bookend_service.dart';
import 'package:bookends/services/i_backend.dart';
import 'package:bookends/services/local_file_service/i_local_file_service.dart';
import 'package:get_it/get_it.dart';

class BookendService extends IBookendService {
  static const String bookendsJsonKey = 'bookends';

  final Map<String, Bookend> _bookends = {};
  final Map<String, Questionnaire> _questionnaires = {};
  final Map<String, Question> _questions = {};

  @override
  Future<void> init() async {
    // Get the local file service and the backend
    final localFileService = GetIt.I<ILocalFileService>();
    final backend = GetIt.I<IBackend>();

    // Get the bookends from the local file service
    final Map<String, dynamic> localBookendJson =
        await localFileService.readFile(
      Constants.localBookendsFile,
    );
    final List<Bookend> localBookends = [];
    if (localBookendJson.containsKey(bookendsJsonKey)) {
      for (var b in localBookendJson[bookendsJsonKey]) {
        localBookends.add(Bookend.fromJson(b));
      }
    } else {
      localFileService.write(
        Constants.localBookendsFile,
        {
          bookendsJsonKey: [],
        },
      );
    }

    // Get the bookends from the backend
    final List<Bookend> cloudBookends = await backend.getBookends();

    // Handle the local bookends first
    final List<Bookend> mergedBookends = localBookends;
    for (final Bookend b in mergedBookends) {
      _unpackBookend(b);
    }
    // If we don't have a bookend from the cloud, add it
    for (final Bookend b in cloudBookends) {
      if (!_bookends.containsKey(b.id)) {
        mergedBookends.add(b);
        _unpackBookend(b);
      }
    }

    // Structure the bookends for easy access
    // Store the bookends in local storage (whatever we retreived from the backend)
    final Map<String, dynamic> bookendJson = {
      bookendsJsonKey: [],
    };
    for (final Bookend b in mergedBookends) {
      bookendJson[bookendsJsonKey].add(b.toJson());
    }
    await localFileService.write(
      Constants.localBookendsFile,
      bookendJson,
    );
  }

  @override
  Bookend? getBookend(String id) {
    return _bookends[id]!;
  }

  @override
  Questionnaire? getQuestionnaire(String id) {
    return _questionnaires[id];
  }

  @override
  Question? getQuestion(String id) {
    return _questions[id];
  }

  /// Deconstructs a bookend and maps it's contents to the appropriate maps
  void _unpackBookend(Bookend b) {
    _bookends[b.id] = b;
    for (final Questionnaire q in b.questionnaires) {
      _questionnaires[q.id] = q;
      for (final Question question in q.questions) {
        _questions[question.id] = question;
      }
    }
  }
}
