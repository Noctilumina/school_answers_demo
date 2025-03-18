import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class AnswerInputField extends StatelessWidget {
  final TextEditingController controller;
  const AnswerInputField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withAlpha(20),
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: AppLocalizations.of(context)?.feedbackText,
          labelStyle: theme.textTheme.bodyMedium,
        ),
      ),
    );
  }
}