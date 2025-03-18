import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/question_text.dart';
import '../../widgets/answer_input_field.dart';
import '../../widgets/button.dart';
import '../../widgets/answer_display.dart';

class QuestionPagePresentation extends ConsumerWidget {
  final String question;
  final VoidCallback onSubmitPressed;
  final TextEditingController controller;
  final String answer;

  const QuestionPagePresentation({
    required this.question,
    required this.onSubmitPressed,
    required this.controller,
    required this.answer,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.appTitle ?? ""),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (!kDebugMode)
          Image.asset(
            'images/question_background.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withAlpha(25),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                QuestionText(question: question),
                const SizedBox(height: 80),
                AnswerInputField(controller: controller),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      controller: controller,
                      buttonText: AppLocalizations.of(context)?.submitButton ?? "",
                      onPressed: onSubmitPressed,
                    ),
                  ]
                ),
                const SizedBox(height: 20),
                if (answer.isNotEmpty) AnswerDisplay(answer: answer),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
