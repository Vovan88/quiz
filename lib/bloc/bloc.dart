import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

final StreamController<List<Question>> _streamControllerQuestion =
    BehaviorSubject<List<Question>>();

Stream<List<Question>> get streamQuestion => _streamControllerQuestion.stream;
StreamSink get _addValueQuestion => _streamControllerQuestion.sink;

Future<List<Question>> getQuestion(String difficulty, String category) async {
  try {
    http.Response response = await http.get(Uri.parse(
        "https://quizapi.io/api/v1/questions?apiKey=j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa&limit=10&category=$category&difficulty=$difficulty"));

    if (response.statusCode == 200) {
      String data = response.body;
      Iterable lQuestion = jsonDecode(data);

      List<Question> question =
          List<Question>.from(lQuestion.map((data) => Question.fromJson(data)));

      _addValueQuestion.add(question);
    }

    return Future.error("No internet");
  } on SocketException catch (_) {
    return Future.error("No internet");
  }
}
