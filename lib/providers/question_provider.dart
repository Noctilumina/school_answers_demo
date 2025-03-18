import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/question_repository.dart';
import '../repositories/mock_question_repository.dart';

final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  return MockQuestionRepository();
});

final questionProvider = FutureProvider<String>((ref) async {
  final repository = ref.watch(questionRepositoryProvider);
  return repository.getQuestion();
});
