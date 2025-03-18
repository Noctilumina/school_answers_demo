import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_answers_demo/providers/answer_provider.dart';

void main() {
  test('AnswerProvider updates state correctly', () {
    // arrange
    final container = ProviderContainer();
    final answerNotifier = container.read(answerProvider.notifier);
    
    // act
    final initialAnswer = container.read(answerProvider);
    const newAnswer = 'Dart';
    answerNotifier.state = newAnswer;
    final updatedAnswer = container.read(answerProvider);

    // assert

    expect(initialAnswer, '');
    expect(updatedAnswer, newAnswer);
  });
}
