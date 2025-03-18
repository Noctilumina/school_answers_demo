import 'dart:async';
import 'question_repository.dart';

class MockQuestionRepository implements QuestionRepository {
  @override
  Future<String> getQuestion() async {
    await Future.delayed(Duration(seconds: 1)); // fake delay for testing
    return "How much wood would a woodchuck chuck if a woodchuck could chuck wood?";
  }
}
