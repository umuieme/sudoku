import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  const AppCheckbox(
      {super.key,
      required this.title,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: value,
            onChanged: (value) => onChanged(value!),
            visualDensity: VisualDensity.compact,
          ),
          Text(
            title,
            style: context.textTheme.headlineSmall,
          )
        ],
      ),
    );
  }
}
