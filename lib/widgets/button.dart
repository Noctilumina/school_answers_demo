import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final TextEditingController controller;
  final String buttonText;
  final VoidCallback onPressed;

  const Button({required this.controller,
    required this.buttonText,
    required this.onPressed,
    super.key});
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size.zero, // Ensures the button is only as big as its content
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16)
        ),
      child: Text(
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
        buttonText
        ),
    );
  }
}
