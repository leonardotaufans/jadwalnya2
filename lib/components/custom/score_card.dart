import 'package:flutter/material.dart';
import 'package:jadwalnya/model/score.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({
    Key? key,
    required this.score,
  }) : super(key: key);

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 120,
      height: 160,
      decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        onTap: () {},
        child: CircularPercentIndicator(
          progressColor:
          score.scoreUser < score.scoreMin
              ? Colors.red
              : Colors.green,
          center: Text('${score.scoreUser}'),
          radius: 80,
          percent: score.scoreUser / 100,
          animation: true,
          footer: Text('${score.scoreName}'),
        ),
      ),
    );
  }
}
