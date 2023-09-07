import 'dart:convert';

import 'package:bookends/models/basic.dart';
import 'package:bookends/services/i_backend.dart';
import 'package:http/http.dart' as http;

class Backend extends IBackend {
  String _url = '';

  @override
  Future<bool> setup({
    required String url,
  }) async {
    _url = url;

    return true;
  }

  @override
  Future<List<Bookend>> getBookends() async {
    final List<Bookend> bookendsList = [];
    try {
      final bookends = await http.get(
        Uri.parse(
          '$_url/bookendall/getall?fields=id,name,public,questionnaires',
        ),
        // headers: {
        //   'Content-Type': 'application/json',
        // },
      );

      final Map<String, dynamic> bookendData = jsonDecode(bookends.body);
      print(bookendData);
      for (var b in bookendData['bookends']) {
        bookendsList.add(Bookend.fromJson(b));
      }
    } catch (e, s) {
      print(e);
      print(s);
    }

    return bookendsList;
  }

  @override
  Future<List<Response>> getResponses() async {
    return [];
  }

  @override
  Future<bool> pushResponse(Response response) async {
    return true;
  }

  @override
  Future<String> getUserInfo() async {
    return '';
  }

  static final Bookend dummyBookend = Bookend(
    id: '1',
    name: 'Daily Bookend',
    public: true,
    questionnaires: [
      Questionnaire(
        id: '1',
        name: 'Morning Mindset',
        description: 'Get your brain ready for the greatness of the day!',
        questions: [
          Question(
              id: '1',
              text: 'Who are you fighting for today?',
              type: 'free_response'),
          Question(
              id: '2',
              text: 'One thing I can get excited about today is...',
              type: 'free_response'),
          Question(
              id: '3',
              text:
                  'A situation that might stress me out or trip me up today could be ... and the way my best self would deal with that is...',
              type: 'free_response'),
          Question(
              id: '4',
              text: 'Three people I can send a voice message to today are...',
              type: 'free_response'),
          Question(
              id: '5',
              text:
                  'If I was a high-performance coach looking at my life from a high level, I would tell myself to remember that ...',
              type: 'free_response'),
          Question(
              id: '6',
              text:
                  "The 3 projects I have to keep in mind that I want to take on, even if I can't act toward them today are... 1 big thing I must do to move each forward are...",
              type: 'free_response'),
          Question(
              id: '10',
              text:
                  'The people I need to request something from to make today successful include...',
              type: 'free_response'),
          Question(
              id: '11',
              text:
                  'The people who have missions that are waiting on me include...',
              type: 'free_response'),
          Question(
              id: '12',
              text: 'What tasks will I complete today no matter what?',
              type: 'free_response'),
          Question(
              id: '13',
              text:
                  'I would know that today was a *great success* if at the end of the day I did, said, or felt...',
              type: 'free_response'),
        ],
      ),
      Questionnaire(
        id: '2',
        name: 'Evening Review',
        description: 'Review the greatness that was your day!',
        questions: [
          Question(
            id: '1',
            text:
                'What tasks did I complete? Which ones did I miss out on? Choose satisfaction.',
            type: 'free_response',
            reliesOn: [
              QuestionId(
                questionnaireId: '1',
                id: '12',
              ),
            ],
          ),
          Question(
            id: '2',
            text:
                'Review my *great success markers*, were you successful today?',
            type: 'free_response',
            reliesOn: [
              QuestionId(
                questionnaireId: '1',
                id: '13',
              ),
            ],
          ),
          Question(
              id: '3',
              text: 'A moment that I really appreciated today was...',
              type: 'free_response'),
          Question(
              id: '4',
              text: 'A situation or task I handled well today was...',
              type: 'free_response'),
          Question(
              id: '5',
              text: 'Something I realized or learned today was...',
              type: 'free_response'),
          Question(
              id: '6',
              text: 'I could have made today even better if I...',
              type: 'free_response'),
          Question(
              id: '7',
              text:
                  'If I was my own high-performance coach, I would tell myself this today...',
              type: 'free_response'),
          Question(
              id: '8',
              text:
                  'Review the calendar for tomorrow, fill in blanks, and visualize each action.',
              type: 'statement'),
          Question(id: '9', text: 'Go do your *life scores*', type: 'statement')
        ],
      ),
    ],
  );
}
