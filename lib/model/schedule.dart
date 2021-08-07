import 'package:jadwalnya/model/assignment.dart';

import 'score.dart';

class Schedule {
  final String id;
  final String name;
  final String day;
  final String startTime, endTime;
  final String location;
  final String? color, altName;
  final String? imageUri;
  final List<Assignment>? assignments;
  final List<Score>? scores;

  Schedule(
      {required this.id,
      required this.name,
      required this.day,
      required this.startTime,
      required this.endTime,
      required this.location,
      this.color,
      this.altName,
      this.imageUri,
      this.assignments,
      this.scores});

  /// If there is imageUri, no need for color/altName

  getAssignmentAmount() {
    if (assignments!.isEmpty || assignments == null) {
      return 0;
    } else {
      return assignments!.length;
    }
  }
}
