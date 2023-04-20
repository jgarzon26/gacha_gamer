import 'package:flutter/material.dart';

class ProceedButton extends StatelessWidget {
  const ProceedButton({
    super.key, required this.onPressed, required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25,),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple[600],
          ),
          onPressed: onPressed,
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}