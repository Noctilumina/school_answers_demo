import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class AnswerDisplay extends StatelessWidget {
  final String answer;
  const AnswerDisplay({required this.answer, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${AppLocalizations.of(context)?.feedbackText}: $answer',
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.center,
    );
  }
}
