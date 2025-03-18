import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_answers_demo/providers/question_provider.dart';

void main() {
  test('QuestionProvider fetches question successfully', () async {
    // arrange & act
    final container = ProviderContainer();
    final question = await container.read(questionProvider.future);

    // assert
    expect(question, "How much wood would a woodchuck chuck if a woodchuck could chuck wood?");
  });
}
