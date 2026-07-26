import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/step_button.dart';
import 'package:flutter/material.dart';

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    this.min = 0,
    this.max,
  });

  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int min;
  final int? max;

  bool get _canDecrement => value > min;
  bool get _canIncrement => max == null || value < max!;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      width: 92,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          StepButton(
            onTap: onDecrement,
            icon: Icons.remove,
            enabled: _canDecrement,
          ),
          hGap(5),
          Text(value.toString(), style: Theme.of(context).textTheme.bodyMedium),
          hGap(5),
          StepButton(
            onTap: onIncrement,
            icon: Icons.add,
            enabled: _canIncrement,
          ),
        ],
      ),
    );
  }
}
