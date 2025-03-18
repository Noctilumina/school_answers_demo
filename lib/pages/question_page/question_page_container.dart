import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/answer_provider.dart';
import '../../providers/question_provider.dart';
import 'question_page_presentation.dart';

class QuestionPageContainer extends ConsumerStatefulWidget {
  const QuestionPageContainer({super.key});

  @override
  ConsumerState<QuestionPageContainer> createState() => _QuestionPageContainerState();
}

class _QuestionPageContainerState extends ConsumerState<QuestionPageContainer> {
  final TextEditingController _controller = TextEditingController();

  void submitPressed() {
    if (_controller.text.isNotEmpty) {
      ref.read(answerProvider.notifier).state = _controller.text;
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final answer = ref.watch(answerProvider);
    final questionAsync = ref.watch(questionProvider);

    return questionAsync.when(
      data: (question) => QuestionPagePresentation(
        question: question,
        onSubmitPressed: submitPressed,
        controller: _controller,
        answer: answer,
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text("${AppLocalizations.of(context)?.error}: ${err.toString()}")),
    );
  }
}
