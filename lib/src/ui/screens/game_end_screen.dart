import 'package:flutter/material.dart';
import 'package:sudoku_mordern/src/config/extensions/context_extension.dart';
import 'package:sudoku_mordern/src/ui/common/primary_button.dart';

class GameEndScreen extends StatelessWidget {
  const GameEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congratulations",
              style: context.textTheme.headlineLarge,
            ),
            const SizedBox(height: 64),
            AppPrimaryButton(
              title: "Main Screen",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
