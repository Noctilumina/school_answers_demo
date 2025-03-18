import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String question;

  const QuestionText({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Theme.of(context).cardTheme.elevation,
      shape: Theme.of(context).cardTheme.shape,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          question,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
