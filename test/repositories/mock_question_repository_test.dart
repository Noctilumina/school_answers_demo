import 'package:flutter_test/flutter_test.dart';
import 'package:school_answers_demo/repositories/mock_question_repository.dart';

void main() {
  test('MockQuestionRepository returns a question', () async {
    // arrange & act
    final repository = MockQuestionRepository();
    final question = await repository.getQuestion();

    // assert
    expect(question, isNotEmpty);
    expect(question, "How much wood would a woodchuck chuck if a woodchuck could chuck wood?");
  });
}
