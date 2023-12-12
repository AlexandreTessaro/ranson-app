import 'package:flutter/material.dart';

class PatientScoreAndMortality extends StatelessWidget {
  final int score;
  final String mortality;

  PatientScoreAndMortality({required this.score, required this.mortality});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pontuação: $score'),
        Text('Mortalidade: $mortality'),
      ],
    );
  }
}