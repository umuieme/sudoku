import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  final int value;
  final int min;
  final int max;
  final int divisions;
  final Function(int) onChanged;
  const AppSlider({
    super.key,
    required this.value,
    required this.onChanged,
    required this.min,
    required this.max,
    required this.divisions,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value.toDouble(),
      divisions: divisions,
      min: min.toDouble(),
      max: max.toDouble(),
      inactiveColor: Colors.white,
      onChanged: (value) => onChanged(value.toInt()),
    );
  }
}
