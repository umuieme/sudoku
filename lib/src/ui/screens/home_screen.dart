import 'package:flutter/material.dart';
import 'package:sudoku_mordern/src/ui/common/primary_button.dart';
import 'package:sudoku_mordern/src/ui/screens/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppPrimaryButton(
          title: "Start Game",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GameScreen(),
                ));
          },
        ),
      ),
    );
  }
}
