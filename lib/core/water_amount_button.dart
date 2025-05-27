import 'package:flutter/material.dart';

class WaterAmountButton extends StatelessWidget {
  final double amount;
  final VoidCallback onPressed;

  const WaterAmountButton({
    super.key,
    required this.amount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text('+${amount}ml'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            shape: const CircleBorder(),
          ),
        ),
        Text('${amount}ml'),
      ],
    );
  }
}