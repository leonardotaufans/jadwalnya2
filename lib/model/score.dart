class Score {
  final String scoreId;
  final String scheduleId;
  final String scoreName;
  final String? scoreDesc;
  final double scoreUser;
  final double scoreMin;

  Score(
      {required this.scoreId,
      required this.scheduleId,
      required this.scoreName,
      this.scoreDesc,
      required this.scoreUser,
      required this.scoreMin});
}
